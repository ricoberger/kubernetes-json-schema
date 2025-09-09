import os
import pytest  # type: ignore
from click.testing import CliRunner

from openapi2jsonschema.command import default

FIXTURE_DIR = os.path.join(os.path.dirname(os.path.realpath(__file__)), "../fixtures")


def test_command(datafiles):
    runner = CliRunner()
    result = runner.invoke(default, [os.path.join(FIXTURE_DIR, "petstore.yaml")])
    assert result.exit_code == 0


def test_version():
    runner = CliRunner()
    result = runner.invoke(default, ["--help"])
    assert result.exit_code == 0
