#!/bin/bash

function post_to_slack () {
	# format message as a code block ```${msg}```
	SLACK_MESSAGE="\`\`\`$1\`\`\`"
	SLACK_URL=https://hooks.slack.com/services/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

	case "$2" in
		INFO)
			SLACK_ICON=':slack:'
			;;
		WARNING)
			SLACK_ICON=':warning:'
			;;
		ERROR)
			SLACK_ICON=':bangbang:'
			;;
		*)
			SLACK_ICON=':slack:'
			;;
	esac

	curl -X POST --data "payload={\"text\": \"${SLACK_ICON} ${SLACK_MESSAGE}\", \"username\": \"login-bot\"}" ${SLACK_URL}
}

USER="User:        $PAM_USER"
SERVICE="Service:     $PAM_SERVICE"
REMOTE="Remote host: $PAM_RHOST"
TTY="TTY:         $PAM_TTY"
DATE="Date:        `date`"
SERVER="Server:      `hostname`"
#CHAGE="`chage -l $PAM_USER | head -3`"
LOGINMESSAGE01="Login Alert on `hostname -s`"
LOGINMESSAGE02="USER:{$PAM_USER} got authenticated successfully!!!"
LOGINMESSAGE03="Login Details:-"
if [ "$PAM_TYPE" = "open_session" ]
then
	post_to_slack "\n${LOGINMESSAGE01}\n${LOGINMESSAGE02}\n${LOGINMESSAGE03}\n${REMOTE}\n${USER}\n${SERVICE}\n${TTY}\n${DATE}\n${SERVER}" "INFO"
fi
exit 0
