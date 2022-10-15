{ lib, fetchFromGitHub, buildGoModule, ... }:

buildGoModule rec {
  pname = "termdbms";
  version = "2022-06-11";

  src = fetchFromGitHub {
    owner = "mathaou";
    repo = "termdbms";
    rev = "be6f397196077cc7c9ced86e6460470e3b223f3e";
    sha256 = "07ra7j26fczlh3792ldp43ph3iyn4wq46f5lygbhvg6kqmlhnp62";
  };

  vendorSha256 = "sha256-fhnRv9ZL3DvsXdPiXL2vazrZP3RODVpFigKEGf0h3ss=";

  ldflags = [ "-s" "-w" "-X=main.Version=${version}" ];

  meta = with lib; {
    homepage = "https://github.com/mathaou/termdbms/";
    description = "A TUI for viewing and editing database files";
    license = licenses.mit;
    maintainers = with maintainers; [ boemjay ];
    mainProgram = "termdbms";
  };
}
