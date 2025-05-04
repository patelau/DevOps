#Author : Chetan Patel
#Date   : 02-05-2025

#!/bin/bash

exec &> configLog.log

# Check if the agent is already configured
if [ ! -f .agent ]; then
  # Configure the agent

./config.sh \
        --unattended \
        --url "${AZP_URL}" \
        --auth pat \
        --token "${AZP_TOKEN}" \
        --projectName "${AZP_PROJECT}" \
        --pool "${AZP_POOL}" \
        --agent "${AGENT_NAME}" \
        --work "${AGENT_WORK_DIR:-_work}" \
        --replace \
        --acceptTeeEula


fi

# Run the agent
./run.sh
