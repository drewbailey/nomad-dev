export NOMAD_VERSION=0.12.0-beta1
if [[ "$NOMAD_VERSION" =~ 0\.1[01]\. ]] || [[ "$NOMAD_VERSION" =~ 0\.[0-9]\. ]]
then
  echo Nomad releases pre-0.12 have unlicensed ent binaries. Not pushing to releases.hashicorp.com
  exit 0
fi

