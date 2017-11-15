#!/bin/sh
if [ "$PAM_TYPE" = "open_session" ]
then
  {
        echo "User:        $PAM_USER"
        echo "Remote Host: $PAM_RHOST"
        echo "Service:     $PAM_SERVICE"
        echo "TTY:         $PAM_TTY"
        echo "Date:        `date`"
        echo "Server:      `hostname`"
    curl -X POST --data "payload={\"text\": \"${:bangbang:} \"}" https://hooks.slack.com/services/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
	
  } | mail -s "$PAM_SERVICE login alert on `hostname -s` for account $PAM_USER " Bijith.Nair@hitachiconsulting.com
fi
exit 0
