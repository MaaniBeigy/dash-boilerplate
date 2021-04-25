"""Application entry point."""
from lib.app import app
application = app.server
if __name__ == "__main__":
    application.run(host="0.0.0.0", debug=False, )
