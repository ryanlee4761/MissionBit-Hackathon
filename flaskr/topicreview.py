import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)


bp = Blueprint('topicreview', __name__, url_prefix='/topicreview')

@bp.route('/test', methods=('GET', 'POST'))
def test():
    return render_template('topicreview/test.html')

@bp.route('/sexualabuse', methods=('GET', 'POST'))
def sexualabuse():
    return render_template('topicreview/sexualabuse.html')