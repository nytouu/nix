{ requireFile, pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
    name = "liga-martianmono-nerd-font";

    src = requireFile {
		  name = "liga-martianmono-nerd-font.zip";
			url = "https://github.com/ToxicFrog/Ligaturizer";
			hash = "s1zg3jw2vi8kv3s67m743r7558jbip2x36q88x2kfmi67g919m89l";
		};

    buildInputs = [ pkgs.unzip ];

    unpackPhase = "unzip $src";

    installPhase = ''
        install -Dm 444 ./LigaMartianMonoNF-Bold.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNF-Bold.ttf
        install -Dm 444 ./LigaMartianMonoNF-Reg.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNF-Reg.ttf
        install -Dm 444 ./LigaMartianMonoNFCond-CondBold.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFCond-CondBold.ttf
        install -Dm 444 ./LigaMartianMonoNFCond-CondReg.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFCond-CondReg.ttf
        install -Dm 444 ./LigaMartianMonoNFCondMed-CondMed.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFCondMed-CondMed.ttf
        install -Dm 444 ./LigaMartianMonoNFM-Bold.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFM-Bold.ttf
        install -Dm 444 ./LigaMartianMonoNFM-Reg.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFM-Reg.ttf
        install -Dm 444 ./LigaMartianMonoNFMCond-CondBold.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFMCond-CondBold.ttf
        install -Dm 444 ./LigaMartianMonoNFMCond-CondReg.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFMCond-CondReg.ttf
        install -Dm 444 ./LigaMartianMonoNFMCondMed-CondMed.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFMCondMed-CondMed.ttf
        install -Dm 444 ./LigaMartianMonoNFMed-Med.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFMed-Med.ttf
        install -Dm 444 ./LigaMartianMonoNFMMed-Med.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFMMed-Med.ttf
        install -Dm 444 ./LigaMartianMonoNFP-Bold.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFP-Bold.ttf
        install -Dm 444 ./LigaMartianMonoNFP-Reg.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFP-Reg.ttf
        install -Dm 444 ./LigaMartianMonoNFPCond-CondBold.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFPCond-CondBold.ttf
        install -Dm 444 ./LigaMartianMonoNFPCond-CondReg.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFPCond-CondReg.ttf
        install -Dm 444 ./LigaMartianMonoNFPCondMed-CondMed.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFPCondMed-CondMed.ttf
        install -Dm 444 ./LigaMartianMonoNFPMed-Med.ttf $out/share/fonts/liga-martianmono-nerd-font/LigaMartianMonoNFPMed-Med.ttf
    '';

}
