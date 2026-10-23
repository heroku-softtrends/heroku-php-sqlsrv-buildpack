#!/usr/bin/env bash
# Runs at dyno boot (sourced from .profile.d). Builds odbc.ini/odbcinst.ini
# pointing at the Microsoft ODBC driver .so that bin/compile copied into
# .apt/usr/lib/, since anything the apt buildpack wrote to /etc at build
# time does not survive into the running dyno's filesystem.

ODBC_LIB_DIR="${HOME}/.apt/usr/lib"

# Find the driver's shared library specifically — don't just grab the first
# file in the directory, which could be any of the other libs apt installed
# (unixODBC, its dependencies, etc.) and silently misconfigure the driver.
MS_ODBC_DRIVER_FILE=""
for f in "${ODBC_LIB_DIR}"/libmsodbcsql-*; do
  [ -e "$f" ] || continue
  MS_ODBC_DRIVER_FILE=$(basename "$f")
  break
done

if [ -z "${MS_ODBC_DRIVER_FILE}" ]; then
  echo "configure-odbc.sh: WARNING no libmsodbcsql-* found under ${ODBC_LIB_DIR} — ODBC driver will not be configured." >&2
  return 0 2>/dev/null || exit 0
fi

MS_ODBC_VERSION=$(echo "${MS_ODBC_DRIVER_FILE}" | grep -o -E '^libmsodbcsql-[0-9]+' | grep -o -E '[0-9]+')

export ODBCSYSINI="${ODBC_LIB_DIR}/odbc/conf"
export ODBCINI="${ODBCSYSINI}/odbc.ini"
mkdir -p "${ODBCSYSINI}"

cat > "${ODBCINI}" <<EOF
[ODBC Driver ${MS_ODBC_VERSION} for SQL Server]
Description=Microsoft ODBC Driver ${MS_ODBC_VERSION} for SQL Server
Driver=/app/.apt/usr/lib/${MS_ODBC_DRIVER_FILE}
UsageCount=1
EOF

cat > "${ODBCSYSINI}/odbcinst.ini" <<EOF
[ODBC Driver ${MS_ODBC_VERSION} for SQL Server]
Description=Microsoft ODBC Driver ${MS_ODBC_VERSION} for SQL Server
Driver=/app/.apt/usr/lib/${MS_ODBC_DRIVER_FILE}
EOF
