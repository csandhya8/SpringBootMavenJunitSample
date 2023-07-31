BUILD_ID=123xyz

echo "- BUILD: $BUILD_ID"
# printf "\tGetting the Progress ID: "
PROGRESS_ID=$(curl --silent \
    -X GET \
    -H "Authorization: ${API_KEY}" \
    "https://g.codefresh.io/api/builds/${BUILD_ID}" \
    | jq -r .progress )
# echo $PROGRESS_ID

# printf "\tGetting the Temporary Logs URL: "
LOGS_URL=$(curl --silent \
    -X GET \
    -H "Authorization: ${API_KEY}" \
    "https://g.codefresh.io/api/progress/${PROGRESS_ID}" \
    | jq -r .location.url )
# echo $LOGS_URL

printf "\tDownloading logs to ${BUILD_ID}.json \n"
curl --silent $LOGS_URL --output ${BUILD_ID}.json
