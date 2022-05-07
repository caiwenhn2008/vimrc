run() {
  echo "path: is $1"
  local string="$1"
  local result=""
  local delimiter="/"
    if [ -n "$string" ]; then
        local part
        while read -d "$delimiter" part; do
            result="${result}.${part}"
        done <<< "$string"
        result="${result}.${part}"
        classpath=$(awk -F 'java.' '{print $2}' <<< "${result}")
        echo $classpath
        mvn exec:java -Dexec.mainClass=${classpath}
    fi
}
