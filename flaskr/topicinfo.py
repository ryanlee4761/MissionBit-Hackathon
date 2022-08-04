import functools

from flask import (
    Blueprint, flash, g, redirect, render_template, request, session, url_for
)


bp = Blueprint('topicinfo', __name__, url_prefix='/topicinfo')

@bp.route('/sexualabuse', methods=('GET', 'POST'))
def sexualabuse():
    return render_template('topicinfo/sexualabuse.html')