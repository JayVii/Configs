#!/usr/bin/env bash
#
# poll.sh (needs to be here: ~/.config/astroid/poll.sh)
# by: JayVii - jayvii@posteo.de - https://www.jayvii.de

# Exit as soon as one of the commands fail.
set -e

# Fetch new mail.
offlineimap

# set revision-token
#REVISION=$(notmuch count --lastmod | cut -f3)
REVISION=0

# Import new mail into the notmuch database.
notmuch new

NEWMAIL=$(notmuch count tag:unread)

if [[ $NEWMAIL == 0 ]]; then
  echo "No new mail."
else
  notify-send "Astroid" "$NEWMAIL new mails." -i "/usr/local/share/astroid/ui/icons/astroid.png" -t 0
fi

# Retagging

  # FSFE
  notmuch tag +staff -- from:staff@lists.fsfe.org or to:staff@lists.fsfe.org or from:team@lists.fsfe.org or to:team@lists.fsfe.org
  notmuch tag +list -- from:@lists.fsfe.org or to:@lists.fsfe.org
  notmuch tag +trans -- from:translators-request@lists.fsfe.org or to:translators-request@lists.fsfe.org or from:translators@lists.fsfe.org or to:translators@lists.fsfe.org
  notmuch tag +ticket -- from:otrs@tickets.fsfe.org or to:otrs@tickets.fsfe.org
  notmuch tag +press -- from:press@fsfeurope.org or to:press@fsfeurope.org or from:pr@lists.fsfe.org or to:pr@lists.fsfe.org
  notmuch tag +disc -- from:discussion@fsfeurope.org or to:discussion@fsfeurope.org or from:discussion@lists.fsfe.org or to:discussion@lists.fsfe.org
  notmuch tag +fosdem -- from:fosdem2018@q.fsfe.org or to:fosdem2018@q.fsfe.org
  notmuch tag +me -- to:me@localhost

  # Spam
  notmuch tag +delete -- to:undisclosed-recipients

# Deleting trash
DELETE=$(notmuch search --output=files tag:delete and tag:iamsure)
if [[ "$DELETE" ]]; then
  rm $DELETE
  notmuch new
fi

# Refreshing Astroid
if [[ $(pidof astroid) ]]; then
  sleep 1
  astroid --refresh $REVISION
fi
