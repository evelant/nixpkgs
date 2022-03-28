{ lib
, buildPythonPackage
, fetchPypi
, msrest
, msrestazure
, azure-common
, azure-mgmt-core
, azure-mgmt-nspkg
}:

buildPythonPackage rec {
  pname = "azure-mgmt-signalr";
  version = "1.1.0";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    sha256 = "sha256-lUNIDyP5W+8aIX7manfMqaO2IJJm/+2O+Buv+Bh4EZE=";
  };

  propagatedBuildInputs = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
    azure-mgmt-nspkg
  ];

  # has no tests
  doCheck = false;

  meta = with lib; {
    description = "This is the Microsoft Azure SignalR Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = licenses.mit;
    maintainers = with maintainers; [ maxwilson ];
  };
}
