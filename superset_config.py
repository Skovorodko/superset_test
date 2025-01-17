import os

#---------------------------------------------------------
# Superset specific config
#---------------------------------------------------------
ROW_LIMIT = 5000

SUPERSET_WORKERS = 4  # the number of web server workers to start

SUPERSET_WEBSERVER_PORT = 8088
#---------------------------------------------------------

#---------------------------------------------------------
# Flask App Builder configuration
#---------------------------------------------------------
# Your App secret key
SECRET_KEY = 'dvdpvmefvpe341'  # Измените на новый безопасный ключ

# The SQLAlchemy connection string to your database backend
# This connection defines the path to the database that stores your
# superset metadata (slices, connections, tables, dashboards, ...).
# Note that the connection information to connect to the datasources
# you want to explore are managed directly in the web UI
SQLALCHEMY_DATABASE_URI = 'postgresql+psycopg2://skovorodko:alexander@superset-db/chinook'

# Flask-WTF flag for CSRF
WTF_CSRF_ENABLED = True
# Add endpoints that need to be exempt from CSRF protection
WTF_CSRF_EXEMPT_LIST = []
# A CSRF token that expires in 1 year
WTF_CSRF_TIME_LIMIT = 60 * 60 * 24 * 365

# Set this API key to enable Mapbox visualizations
MAPBOX_API_KEY = os.getenv('MAPBOX_API_KEY', '')

#---------------------------------------------------------
# Cache configuration
#---------------------------------------------------------
CACHE_CONFIG = {
    'CACHE_TYPE': 'simple'
}

#---------------------------------------------------------
# Other configurations
#---------------------------------------------------------
# If you want to enable the new Dashboard native filters feature
# DASHBOARD_NATIVE_FILTERS = True

