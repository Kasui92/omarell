cd $OMAKUB_PATH
last_updated_at=$(git log -1 --format=%cd --date=unix)
git pull

if [ -d "$OMAKUB_PATH/migrations" ] && [ "$(ls -A $OMAKUB_PATH/migrations)" ]; then
  for file in $OMAKUB_PATH/migrations/*.sh; do
    filename=$(basename "$file")
    migrate_at="${filename%.sh}"

    if [ $migrate_at -gt $last_updated_at ]; then
      echo "Running migration for $migrate_at"
      source $file
    fi
  done
fi

cd -