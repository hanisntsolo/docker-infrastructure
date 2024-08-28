#!/bin/bash

# Define the backup directory
backup_dir="$DB_BACKUP_DIRECTORY"
retention_days=30
# Ensure the backup directory exists
if [ ! -d "$backup_dir" ]; then
  echo "Backup directory $backup_dir does not exist. Creating it now."
  mkdir -p "$backup_dir"
fi

# Define a function to get the MySQL root password from environment variables
get_mysql_password() {
  local container_name=$1
  # Fetch password from environment variables based on container name
  case $container_name in
    firefly_iii_db)
      echo "$FIREFLY_DB_PASSWORD"
      ;;
    jupyter_db)
      echo "$JUPYTER_MYSQL_PASSWORD"
      ;;
    *)
      echo "Password not found for container $container_name"
      exit 1
      ;;
  esac
}

# Get the MySQL container IDs and names
mysql_containers=$(docker ps --filter "ancestor=mysql:8.0.34" --format "{{.ID}} {{.Names}}")

# Iterate over each MySQL container
while read -r container_id container_name; do
  # Get the password for the current container
  password=$(get_mysql_password "$container_name")

  if [ -z "$password" ]; then
    echo "Skipping backup for container $container_name due to missing password."
    continue
  fi

  # Define the backup file name
  backup_file="$backup_dir/${container_name}_$(date +%F_%T).sql"

  # Execute the mysqldump command inside the container
  docker exec "$container_id" mysqldump -uroot -p"$password" --all-databases > "$backup_file"

  echo "Backup for container $container_name completed and stored in $backup_file."
done <<< "$mysql_containers"
# Cleanup old backups
find "$backup_dir" -type f -name "*.sql" -mtime +$retention_days -exec rm {} \;

echo "Old backups older than $retention_days days have been deleted."
