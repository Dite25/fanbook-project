set -e

export PYTHONUNBUFFERED=true

VIRTUALENV=".data/xenx"

if [ ! -d "$VIRTUALENV" ]; then
    python3 -m venv "$VIRTUALENV"
fi

if [ ! -f "$VIRTUALENV/bin/pip" ]; then
    curl --silent --show-error --retry 5 https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    $VIRTUALENV/bin/python get-pip.py
fi

$VIRTUALENV/bin/pip install -r requirements.txt

$VIRTUALENV/bin/python app.py
Footer