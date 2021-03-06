# Generated by carnix 0.7.2: carnix nix --src ./.
{ lib, buildPlatform, buildRustCrate, fetchgit }:
let kernel = buildPlatform.parsed.kernel.name;
    abi = buildPlatform.parsed.abi.name;
    include = includedFiles: src: builtins.filterSource (path: type:
      lib.lists.any (f:
        let p = toString (src + ("/" + f)); in
        (path == p) || (type == "directory" && lib.strings.hasPrefix path p)
      ) includedFiles
    ) src;
    updateFeatures = f: up: functions: builtins.deepSeq f (lib.lists.foldl' (features: fun: fun features) (lib.attrsets.recursiveUpdate f up) functions);
    mapFeatures = features: map (fun: fun { features = features; });
    mkFeatures = feat: lib.lists.foldl (features: featureName:
      if feat.${featureName} or false then
        [ featureName ] ++ features
      else
        features
    ) [] (builtins.attrNames feat);
in
rec {
  all_crates = f: all_crates_1_1_1 { features = all_crates_1_1_1_features { all_crates_1_1_1 = f; }; };
  __all = [ (all_crates {}) ];
  all_crates_1_1_1_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "all_crates";
    version = "1.1.1";
    authors = [  ];
    src = ./.;
    inherit dependencies buildDependencies features;
  };
  hello_1_0_4_ = { dependencies?[], buildDependencies?[], features?[] }: buildRustCrate {
    crateName = "hello";
    version = "1.0.4";
    authors = [ "jemcroft" ];
    sha256 = "0kgyagy0xpzmb78wyfacnq33q85vndspaj610lhnm3qg1xk788jk";
    inherit dependencies buildDependencies features;
  };
  all_crates_1_1_1 = { features?(all_crates_1_1_1_features {}) }: all_crates_1_1_1_ {
    dependencies = mapFeatures features ([ hello_1_0_4 ]);
  };
  all_crates_1_1_1_features = f: updateFeatures f (rec {
    all_crates_1_1_1.default = (f.all_crates_1_1_1.default or true);
    hello_1_0_4.default = true;
  }) [ hello_1_0_4_features ];
  hello_1_0_4 = { features?(hello_1_0_4_features {}) }: hello_1_0_4_ {};
  hello_1_0_4_features = f: updateFeatures f (rec {
    hello_1_0_4.default = (f.hello_1_0_4.default or true);
  }) [];
}
