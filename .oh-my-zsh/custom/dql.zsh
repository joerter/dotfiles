# These go in .bash_profile, make sure to use the correct aws profile 
# names as you have configured on your machine.

################################################################################
#     DQL: Dynamo DB query helpers
################################################################################

function dql.docs {
  https://dql.readthedocs.io/en/latest/topics/queries/select.html
}

# This is if you have dynamodb running locally.
function dql.start.local {
  dql -r us-east-1 --host localhost --port 8000 $*
}
function dql.start.dev {
  AWS_PROFILE=developer-dev dql -r us-east-1 $*
}
function dql.start.staging {
  AWS_PROFILE=developer-staging dql -r us-east-1 $*
}
function dql.start.prod {
  AWS_PROFILE=developer-prod dql -r us-east-1 $*
}

# This is for connecting with a specific service profile.
# ex: dql.start my-service-profile-dev
function dql.start {
  AWS_PROFILE="${1:-passportlabs-dev}" dql -r us-east-1
}
