nonuser_reverter() {
  if git merge-base --is-ancestor $_committorevert HEAD; then
	 git revert -n --no-edit $_committorevert || (error "Patch application has failed. The error was logged to $_where/prepare.log for your convenience." && exit 1)
  fi
}

_hotfix_mainlinereverts=(58f2326410dd5574e52ab3362b67ab345674c3b1 2b9a0550bcda166afdf852370397e1041c096f5f f4661f1b38c479bd08baee93d9ddb1f9e93c173d 01c05387ce56ad99bd0b629a41317d7058a82462 151b42953b49bc0417c53656b0040ef765a8cbef df8578da8ef4f6e9e480e1c49cd82ebdf8281d38 7ca68a86313e39d21cc92eac84a00841318143ae 21c99970f3c423e2b8b1f92b2b44c5dce7cc28bf e5bd1ba4ad4802c3f589fc91b8953205af52a978 eb293d7645eddbac8e94086a58d460b4407f4b58 029843176b11404a77384b40ca3e9a99226477fe 15684bd5aa557562072a749ab4782489fcd27546 8b5e0bdf8b9db3ab19bbabdb2ce591f5fc876ac7 3863b243fe5ef4e223a809e93a85e858952dd754 75e616d52b452d37cc93f492d47eba641f9741c1 aef321ec0f9b54cc07071e0757c57b73210f304c e703e2da39a411e1f0aaf6d5ff7a1fa36edb87cd b75ae8c31eba2a59e2b32bf8d456ca5756ac6e0d 4225ec994e64f365b0b093609a3343c0ae1987f0 65c37cee249984884af40d91aa14706d81e128bf 1581fb619b879b58a402bc64ad81bde265b926e8 a9639dd6053f1e7de915c29851cc1be45ed537d0 99a6ae5b863b220e72f01abc9ce3ab1c7be9d7f7 a8ddcf7dfe64b727a0c06d0a008a0ca5b227868c af1a328fa0da4df7a73688528e49a568dcea995e 482b64effd44a8f601d3327eed84ce6d61432cf3 4e5811637ad027d01cc5033f76b03e6e8cfdd287 0e7f6e0ed32ffe5fe09ae429037fc28dcbebe6ea a12e308ebaa226caaaa8e8c932bc2c7687914d21 bc3284f818f70d2de0bc76beaa69a3352f27fd34 41d1fd3229eaaa42f4057fbfa335e0e6d665233e 8c0c70dd0f0cccfe1e2c9706f4645e7fce13078c a729af0e9c0027e7f9686df7e3d85ec1ab3cfb37 aaea13a128b76fa0076b8852187c7d10e5eb5d68 9012096b47d8422a296734ecbedb226188e93501 47fe53172971cfd233b30b33cf0d710c6317279c 8ea62f2ed13865d866a38b80f24caca02ef72447 d2496e2d5c5ea4bde34659ba88cea52e8c27facb e40de801b5e757f13e5d699fa22368bf1939d444 6c7f389c5ee3a1e55835a1c25cfc4160e0f214ea 0e939eb969d3bd3caab3d5efea4778db07c00c87 5a151b060a08f36d9a667dec8d0e9fbdbe0851f2 7571fa87df453e404d8b6ca58e2da95340156849 97847eeee8aaaad9b141e14d4468838960ea3093 6844ff8a0bda7c0511c3c328f459cc4286bf3c5d 0b3db9dfa2877ff36c10f73b04e97af71ab2f845 8bd95a80f263a8df6873f8e3a8b10fdce4136fc4 057e7f19407f0291cb4240c23fc391263ba9faa8 32c618b7c5f5c1891de7833986ad95c9aeec69f9 601175822e9c61ce02e21f20c76daf1b760d6924 9aa885bf37c01df1e8f00852681806ec4c21b040 2c3719c7a9b370461d18c4422dd965dda80cb859 16ed88a95234d844fee9fc19053c5c7f618f92ba 3f562e0b919083bbb988474d50f70b9c5370e29d 3c9d10d756746ea21ec83f78de42ede871a0222a 8231dbf04961356a74bf026cfd3e359605ddc81e 898e121b2e1628e91ebe9dee1c1cf8f959f7cd4c d902c333066e57ba3587ffd72e6a2bf08f9319ca e24ba09f8f35b146de178e492c8071d1923bfa88 76037ffbeefc7b15b764b4d6079bb6c939176523 36663d9abd0fc085c1197429a78dfbe86c1dc56a 0ec191eb0fd161e3bbd9e92270282d3d81e2cf11 7ea9f9edeed417a241d607bac282d68bdf5abd36 5f0d268fffc741171fcf9006012c310128846de5 0267a04547770fe75147aa025e11045aca5c4ed9 7531091f33dcd0dc849cfb5df918e9a331f7a6b8 5b3842451ba6c7a37a24e0f16707d8a19020287d 13ea90d80f7275e1ad4f3fc3c1c75b68bdbefbb4 a4af2b2b70db96309172b226dc6163e90d565420 97b5ad7597bf2add39251d7379fc607bf1578478 22f4b6fcf5014b6d98188253636c116e50446c44 de1cb029f6e9bd6b8959695f5d0ae55188d9b723 25d4c50db3b2cd5113709b98adfd3de86b6e19ec 1721f0ff2759a0dfce166f20653058248f188521 77fbf3a9fde517ecb4d23e0bc121668206fec2f3 a686759f1d7aee67b5786b72e81a4e4fcf3f3c02 53e0bf2f9f0f9876ca89e4c9133d9d5265b3e9dd 4a7cd0f492affbc0eb347b97426b8c23f9a4f976 f332f2e4e28e9618e7b4a65e9352915cf9772e93 525e7078a83f568d10183327ab3fa6b82d08d41b 8f3bd63b52f03ff05e9d2a00a2e129a0b0092969 7f8224411c39242fe751524816b1349002066c72 cffd06ea67f34a8f6379c78330c40d55ba83223f 849d08b0aed1b256ac459347cb488ef3db5ce3f9 30596feb03098b392bd5078a1a2d390567681b3c 2a62242747aa17a1a4ad7443b0ace900f72682c9 6cff65900dd299f596636ca5449b0f99e825cf97 32eb41de8caaa9462406c859c8242df5a6ebf343 c6e0cb6c720c56541ebb45a6b4821d46f0300f36 e8f2c2464a3ce47e84be7786691ba35d25c7e6a8 2306efc3fae152586348a618fce3d8398a883924 f54c7205b6ac387ee394c8877245f0d0f3a3cc7a 36fc962f5c0f2fd33cfd09c816017655104c4201 7444aa42306cd0e091dd46efc2e0be3c7c61b2fa 3576258402f5e23ad059cf446eafef7fb2c10430 4faed406d428a2cec752c2aa1bda8449a1342057 00b4a51fcc325fe1a5f2d1dbc7b81dacf4686b4c 71090bdc2f5051f181c193ea410e6438b92c9c37 ae07938ba661dc0515673835878710a25c99eec8 447bce4117a58910690a0d2610ebcbdd49ae9127 81d1c79dcda0eea8fd35b2dcc6dfa3c3a17e2393 225be12999ef8d7e9c8a504d0d26254c9cace568 1e7378d80c20fc8f45a246fd043ef4e2911e94f5 1d65e474b1a5aa3ea60e6b14c7a49479b35cc7e1 43ce429234a568cca6d563e0464acc3cfbbdbd50 0451e44d957325e9de348b8701058e19ce47dc57 ac94d8890558bcb34d28ee7c2f276bf994faa8a5 09ff2436c4b1be1f379aec7e4f0b625c6dbc90e2 06c3e7e44cb40ac2e6e6c55029103d63f47f9e5f 57a222356cb675beec38268c2736628e0fb3d231 ccaaf6957f525f09ba485377a606ce322ab90792 c76dc32feffaeed260bf73499e43012b69bee1b4 76556bc5885b45f88ca436fb2f04cdf79bc29af0 d4052e0d709d7fddcb6a4adc10e98a8e65c8218e cd8971399e35a8feaa841025ab74857a85bf5678 5a6341d8c7cbd19308dead261ef67c5c1e5e4f0b 3d4be8e150bf37607b25dce0db2931384e5cadd7 dc8085142528305605ef4af621ba56f2aa75da65 26c078a2a64e515323bfbb4fcbdaf161150942ba 94ee27097228ac37f1576565c9f93f6186ff66a3 f804d1ac70f0f113ddd0295dcb83707776cdbd2f 9b7f14f1b49e838f5edc74296fd53b7215a8b52d 1e7e21534e6598782e77c38907573fa0e118e13b 13abe9e2bd58f636efa2149eee8172f37b5ddef3 4f3534fa6f0e4b7ec9e3d446b394afca612e21ba 7a71f98640bf8fa402d6b0c3ec30b40818710ee7 2a08e0e29025f335acd77f7d899afa7f45240b2b 9014dae8fb7b78cdd8a200278a1e2a5caccd533a 93fa2e0ab82a9506fb71bf0f536fa521f58ea88c f7895ef25a4cb2115ffbe04d28b87bcb6ee3c0b7 734a7120b6ca73ac4286fc8efaddf74534b7a513 d29c33a35c56f9a348ca8a8de01b7fe7eb4c4ef4 1d3e3a1c8d08c75e88734ec00b5a2b412e8d6ca3 2b76b9f234eb5d4753337d8b080f2c050daae3ff 0720c6cfd0b8c863fd22053c2ca750fd982d49d2 69f1b12a30bbf28e750206f0ec1ab2c6320abcbd 2c903e9e9bb1254a9fbed60767b56668e675f64e 647c54e539c6dcc76c6289bad0fc387274d999eb 31800a1414a33995eba7c89d65a93d69beee47b3 f4e55565470938d31e21f4a35aa14e5a950f81c8 ed8358393413d52096c56e96b44ee73f15053f91 a09a268faeb29fb6cffd6e422843659793f09ced 53f17314aa97d4aba8d37d76ae878cbae20818bf bd54f39766e53f92909bc208e5746497c0dc5d69 e7550069ded02c1f8503a15e155127e1e2c26f6a fa2b372ec02d3755ce892612750238f41b39ad85 504d6eaa9a0642e6c71aa320cb5ac1e88dc44a01 78831ae9d044ffb824e72cb8952f3eb25140c7c9 b7e51a1653320d06a9c04f53d0d9e7eda577c31b 3f8d60e2ac5997766f19107aef23e351c7d68a03 305da71c7d8098bf2d2a07584a25be2e5fcc2b91 c37c9bf65a6f6dfd9708f6654227a953504dc158 1f5a45e63ecff2f83eb927e253007bd75fb36c05 ad1f09d57424b26bcf463dd45b5b0acb5bd97029 fef78c4e10422319736f290e44493838e4257a04 e7c9a0e1511641961a69babe2ab7aca75c636672 b6b2667482a14e4cd76da48940ead142ce207b2e 3609406308110f93f11c6045da5734f038ef727c 7ae370a5491b58eeec03961b09dcf5ae5e53e411 f6fb372a045256d84d6e18d4757b9f59e209cf0e f8fa6fd68608b53def2c34a489b5af2416f47cd7 5f6bb63800c14a46a4124c5a5e42094cae3a38fc 300a01f467e84bb69bf6387e52545ddbc9c456dc 44052219aa0e6412a0f595f830c0cdf6e82ea70c 7a31d401391c9c66173a599cadbbb6946f607927 eee92591bcf4eb7e1f0d91e24c47b5021a9c81fe 06c09fca3127fce9d3a3d1b4714173404ee58629 8e5c11b964e844696c7f5882d3b8dd7ff70a7869 94ca95a6d444e8cd1592bd41f09cba2e1ae49902 d775b9fd93ecfbbd12945f1e167e4bb381612c69 57f419993eb8088ef210e8a56b07acf63509b159 15b3584603205b93e6e6a0bace6159438ce22ffb 28e443d9e2a3bfea936b4f6f97bf78f6ccf6a91a 9a7c56d9e7f8e49dc98dace53b10d0753f0e27a7 8e3b5183cc79b99ac74e2cb3f665f8e46a076495 29d5c6c476faa00529fe765150d014607da48f27 928fffee8dac4a9555bbbc141d9f29483422eee1 b37371bf20be58ee7bd0b63dbac15b474873bc86 d18b5669952bf1639be78fd699310231d4de0259 a865a4f61d413d85d6ae4e57d3c14c0657d3a598 e3b059b5bad4b7ff23459a6384c866e3da1bdee1 0bf52b09f2913b2f718fb32ccd0b1300bdada679 9f3e9d464da8806acd185783f4d2350dd675fd2e 98bee7881a30eb01fb3d633f008957919a4aa71b db886f09236759141a95183be83c666cac5f9a64 30453f0acf8bdca4dec5de38d08a776b933256c8 09ab7e8a0c9c96624e4597b6e91cb202a8086ef9 5b795b658d14bd85ba6783131c6f42a37cfcce27 9018a377355fb2906d06b50008d04761491bbfd9 131e53a1fc2cd7156b56402c97d53af8da72399e 1372d8fc2cac3466d759500063a50d86f03dc94a d41b1c28c378c531cc9c66639bfa16778972281d 78c772e9d802d13522855fa3c8e2257c4933214a 4752e252ea6ee084b679a9b9551a1c55f8744451 5eefbc6db98985a5b63bec78fde7eef2f7fa02f2 688799b1f7b2750b938f8da771480d2c16d1ae1d f8d42a31c624f28f6c9bfd9678fb025bf15e9c12 e613d81d815d96a04eca42eea5faec71bdd459d9 2e5b8ffcc9ab8ac750e6fb2ac32eadeb6698540d dc1483c179d8e6e8ac1efe1fb54d8f1f2395077d cb28c2dbb0d92bcddea768bd5d43c5caecba6a0f fc7dae4ba5edd734bb0ffc7318dcc659d1797f2b 2fc11e8952bff715115425346d0ccbaed146bcd5 96c5109a0f1a4b203e2a0575764a2577f5270c52 bd12ec5dfff885a1bd5a5d05b2ec48129e6f4398 abe5fda90d918e0efbc0f4e122eee7cf637a2e9c dcd02876ea73f65dc286038f0f70189c4994152f 9def213de32a80fcfb05a7474be42f44d7a0c939 0e45f7b4cd8bbf8833737cb2f4f6aedecbe3a7de f298db7254a42b2818083469bba0ed8080be38de dd77ff754b949c21c986b61592cdc91884f2e175 a47f4daf8f70bc389fb1789e3e90df6138cf0549 ff9ce43c0127bd23d5aaf9cb6bbb28fcbe729fac 17785690c047d507d8031aced658b716969e8668 9dd1eaab44ae3677bb93160d4d7d709b26202dac 519f86d5aa4f61e47bcbf3a7207354523aa752e2 8ac77cfbf96689d83463928a9d0bdc5fcd054cb9 f3ca16379d8c06f3342fc3039f4be926325808b8 b1af31b47aa96ae5f6a8444ffba7a060f7ef6099 180f7cf412c486a4f2f769b44c0ccf1223226ee3 d2b0c10000ad53dbc0aa717b31f18f9078f35c7f f4d7d8955098a0255733ae304349415fa373049c b68138a62e849036b75954f7a406c64be5d86e21 6039b785947088d379672c709c227b96ce3be1e5 500131b2f5fcdc09eb15bb5db740b6ae5dfd9390 e0a2f85b788b5cd764582a71fadaee11f06ab979 e7c60141d616b609b99e59a19375fc9759c3e4fa 398cfe48079ce02f0f13f62273b31f5ee0fd1a4b 0eae5d3abc64e6496df5d7d7b36944e0cfada76e 76e48978a95deed5eb5fa601486648e3665d21ad 28bf959c5c342faa956e718823bcabb06a4c4c30 7053b7c615b44e7112ab8fb4c056206d32b6f1c9 de1eaee4804ffbeb0917b139638adb19c2106936 2a539470287005b51e2e72f27026fde26691ba65 5e240cdf50dc10003a8663ec9be51f9d8bb42634 d7e12831b04ed6645558bdeec41e09311200d7f3 9415667cdfbb4c94cdfe03a1e80a87482bee98c1 919a94aa954f543b49728f1750ea23aab21cc41c c4789b08f3bcc879d3a95b1023626a3e2a3a8967 5a174dd60446effe39f78ec7b4394e80e2522d98 2aa58e43a0d8589aa37f275147e5beab023b5d42 12dba1b2ae50099de4cd857f867ebcaefe6852d8 3347ad003a1f86b6d1cd83b63a8e8dac1e8e784f 1cf4a1c0880f0f39f6d986db53a3b108a6e5c648 088ababfc24751b951008570f6160a1e8dca0e0c 77e74fb1dbc8a435cefe17998dc73a4e40c3aeed c7032e9222fdfd3b4364d6c729fa5ca6f0b35f69 26c8fb8ce7a09698cdba73576cf924185dffd3a9 0534beb331ff9f1444db47cfb3c03224c1837aca 40d403c926e8f96c77d067188c842c12f099f9a9 e3e477e6a14fbcb153258b47d1905915dc4c1f22 3b4c2ffb7bcc86165c67def31debfa63ccae7a62 635e914bdeca3a148dab8aeabc8037a2e7ac8151 00e7d50f8bd3dccf2c34dac2501937b7d294ab76 c5f66fc784d20154f3d5905d25f8243a0fc6a330 eb45a75a2e76e9716d08ae35cc2512b02e3bf85d 9f8acda1677e90a5f429ef8db739adce700629ca aa08e1541510357f3c3865cc959cc1d60a1b86cf 66e6d87ab86c393f189aa8d409b62b3e028ed17e 3f51cb630497621042c0479d8a604d74a837ba3b f4c403d1f2100934c24241b0ed8f4e19cb0ff4dd bc2164e07487edccc32bff06691d14ab017a3f47 d1f83537e7f064f0f77ead043617bc213c8c0053 14994715e9337821aeac39c0f43b704bdc7ba200 42cb7d2ad1caba08de235e6319b9967296b5d554 823c55ad2755c36f55cce1f0cf5f0ee6dcaf9d76 ffa52880f2519c885ce61b89b847c82e0531c032 037b91620c4caafae943e7cd304f0d9df4335d21 4ea42892539d84e6fd5bb864d18ef26d0e2038d4 6e9d3d2014145930f688f4c5c9043d5112d41b6e d2b83336c7b219b3267035bd6ab9af5480184743 3c1ebfdf82242e28ef697c139e0e94cb5ceb3fcd 9ed6d24ed83d20796e2c5190365c26426a0c6a87 73fc0a18a693c179d676d38fe8cf0df8f7679ea9 7c4f2d5342a8673af994077ed2e586b0f3410583 704d0662bef08a980c87c408fa33f50fc60b5cac 82dc024a35a1a522b088df4e9355fa7752f40821 7b795324483504e911350a8c0710d4c2fa2b6dee 3889c374a11d92733f6830473ff589f8846a7396 ae15a4ca5a1c7270dcfe4f7456ea75fc946ab279 adb4e74b479d5406454dffa17fe908742306ac6e 1e4865ffcfa4933ff27b1e66405e1498dd9d1781 485c8566f103f05dba3c8c31d3adb18b89eb032a ca45eda758e29261691b27eecf1f4fc78bdfadc5 9a9fb47e24d3daa57aa24bc5529e33b6271b92bc f1e4c54104d92f57d0b3699a800c0f09ce4e8320 432d504118f4c00cc33c199946b36448cc6355e1 5a68254c131290adbf51843aa82f543afe99fe87 f30ba2cf256054c4aa6b75ff2f282dfe8e2c219a 99851ca4c2edd4b921c91327540d69dec77c5df7 e9b3660e729929f4e09f403d526759d532df03e0 4617f83fcf0a34fe41b0e38dde1567195395efca 35352575e4e8d9fc753dad583f2b24ed999ec8db dce5b9add1f9221c176e47c920e247ceeb70632c a07aa965e5d3c2f4a46387ad911ef1c8500e2107 440e31a73212382362cf64982de8ecf2d579cdb4 bf6a803e04db1c466c9e7b1fd44e17ee10b17381 6b96e0e0cbdc28e9dbde3fa3d9bc948b512fd1fb a6fb7be678438ab689ac87ad4ed21a9b33a17c2e 20bc32cddc6ca8b1e2577cbc12050804972ca0ac 242dc8989a993d1b3807f437fbac7b92707b6e28 fe7b8d70d5229c693dc16b743ef0ec7f76a1569f 42a2ad202e6a260dc9e3f04939c7dacf270f7434 83f9e784e42c404e31172e55a406a8403c8a33de e9abe3f7395a81dcb6d192b48bd54848dc4f2b5e b2d38f15314e39eeb17ec5e02bc6fe78b26420e3 9ec5be2cea3af2ca631ef0dce3208965058abb59 1037bf54bf056090855c3e2dc8c70193f18a243e ef01f6ac1338dcb100bc2ff5cd1cf360d7d8520f fdb3d9ae320363c1bd9fa716b167a7ad313e638b 5498ebd8c0aaa651ce6823cccdf572a3f551deba 052e8dbf5985ffa5875067491b03a523257752f9 85db4f7ec28a5d68fecba624f518dc1d2a07e359 d7ef680e950431d868e6d52418513472af7edbb3 3b745f17b5553f88011a50a7b355f0eb3f5084b9 99520e1997b92155b9e389513960b0bdacfab9b2 992bdd77a05755ccbde22bf244a41ab3c50086db fdb09f452376ead1fceeb04dc5407095467418c1 c71da19d24a5d6f01e65b3b3691a9d7dd17a2278 c6fea822a99ca4b5c82e5217a0a631434ad52c29 0e46dd09e5c71726f0c120362991cd3b2613295b 7aadafbd505ab61c15bccb7d995cc9f4afc54e3d 22f53e6d9dd23a88d75ec8b6e4b3a73a186344d1 f5badeac28dc245c4804d4d0a72ddfcea66846ac 48a23dbd432d8dbeaa884fe656105d902729f8de 409160bb596e44bcceee24d9ecd4d2629cbd6cb7 4d57e8f937fc866d092539ceafb989d740462d2c 9c6d0f6eeab8eb58a9cfc4ba3c1d3c9145b1d8db 6695ca86a29c4ba3844445480d5591c0dd75a824 07194e9287eb2e2adbc2d1bdff204b4f8dec3ef0 2efb498a7b088a0d1d072754b668fcf752532de7 f7a7633aa107003238171c12f52d2f57b93bc3f2 b21d2e5f58dc5fa713174616de5042e05e13a1fe 5ff23d2218b6166c78cd587b1f633a2a3540a541 3b81ea316198e1b128e0e41534da48218f5b641a 86acbd0122ddad629f4ac55595782f2c704d54dc 674ec0c7f6754c47a5a513ceff80663bb8f5a3e4 fb8a44f3ee50badd85af4b50fdbc1db28ce76ab0 63b66c9955b243e20b280dac236dea4fdf21c92c afb16545671e7420c7a8bbb4ef97333c33001564 bcc3410732c60e32eaf3abd808be7482218f57d7 0357d2ca75be92e927bb785a786d3766c94f3c83 9ac3f24f744bf76c252fafb2c2e254bbbf38ed1e 4a49af0cbeb1bb5570d92f679c98ad05abc693e6 eccd21e38735fb08e31a4be1a8897ebe248747b4 9ec262ebcc7f14d7373841d4ca082b855ed8090f a2e77268f2007f2819c2e3e8bd736a056f309a4c 0a57d3853bd0b3bfd25b7d171e8c9bddca22f52a 56ee3a8ad12b02e2c53a2f3737bcd6ba15fd4737 94c1640bb38edd76bab13b29f1444bce20edcacc 587ca81f8de4fec07217b4e55e370f3fb6095773 547855e623c561c23b205f18d017e53d5ee75b7b d25a267978de5949a283c5f76405175316f8f773 2789787f011e1a923dc22b6884433826e9350725 0c3c89b74decfdab8e0227d87e5eecdb3380806c af3320c57576166e0d306c1e4d9d4d3964ad58b1 d8739008bd33dfe2587d4afc524b17ec87f59ddd 095b0f5acc225ab79db2406d42686b8c51b4d887 e722660114e268179344e2e076a8e10b0f8ab3f3 b72270cb16bc670bbf46be6fdc8dffc525d82f35 7e4ea871a33f226684ecef9ba158cf9cf8efe42d 829c7595130bb84e131b797e45a84176b169a81c b14eee69c7240658252bc96b6302e98948f2c62c 113e9811c473dd73b14964893cecf0c7042502cc 6f862a1ad803b1a7037797cedb3624445538afc1 5ebdeaaa372186b4c3a9098676c76423a1781154 368e3a93b8da3641c53f260bb4c96d03d00d1080 d0a16b7dc99a4040e4e804c04d71a24b3a9d829e 461fc592ad1462c022bcf1c2cebfaee2bb5cc1de ca0db956a65f9010983c6723643e50df115ef34a 340a661723eab4afe2204837716e2b53cc14f5f2 378ce9e6bea05fed194d44666eabd7a0d25caffd a0d325333fb0cba6028a15b924dd115cbbdc0586 845156cc3dc8c8c6b1b62fcb57bcdfc25c94e100 1320b15dfc87997e60d7a2af70000e5650b83cba 49fcd632e4b512421810ec4e35dc455b3f7697d3 f8699c0a71a528d287b84cd0bc5b5bb7cec924f0 518decf16b8445f49cb8bddfd081e7911ae28212 917a206b01c82170a862e8497cbe26b6f1bfade0 20715ee3fdaa794a7b6ba285cdb72b68991c65af 82cd85b07918a4437428497ffaf7f13286b83479 829739273425ba3a275aa8b93cde82bdff02975c d33474fa6bae057b6e7fd6acda76438d90dc66bc e0e3b6bc91f7db956e3a66f2938eea45d4055a39 8898a6951988c95db3e92146b948a3b2aed08fd2 a4ab07a653d5bc912e954c1fb970aeabb6daafe1 640773aa9ee64201dd4985254bb259b14f7f640b d04baa29e296599f3736ab9bd7c830451eb3335d eff42369e9c59f330083e25a23762df084ce6869 2d38551dd9012db1361cbd5ff3de6cb5fb90dc60 1a43c5de71eea457855f7dcfb7e5811f1c74ebf8 434871fd1b6d1fef8c68e8d35689caec49367e20 1ff8fe20bf87f0b60e2b1a185fd3f9ee383fe31c 8622eb326fb8120fc038e27947e61677d4124f15 ec3cdaba4f018a87ef2fdfdb2e47a8b7811402f1 af3aee8a5a2852951b1fbc6e355e674fed9d4c5c c198390c78acefdfd95ef3474f192a44f8e80b2c dfa48037ec462c279bf314670d07f04696a9a25c b2d09cbb219e43a203d908199cf0ada1aa344b8e a0266339c777eafcda918a253ec8d287372fc84d 031c744a1fb9b94f7a4634eae5f56845b586554d b116cf848a0816e8d03fad93bba1022baf53a229 e3caa9c420bcad90bb850e588845d18f4d99e435 25f7aa52adf126b24c1fa2eaed9bd4b40152aa82 af9a8b1b0890cad21b23279d7f0dae083859e960 4448715cfbd70b214c332ab9fdfdfe3f28508177 dc672b49ca887c78a3e20854d96e7a56e967c072 e5493e34e4a0c21771200b0ecb72b7c24c484f39 5376bc5ee48f4ec3485dd404b32bd2530c24d3f7 66fb3802d31b34360f87edd11eb6508bca785824 086072ca6aa98e1d3107cac828c1d96cba01eeca 695bf7a64532fe9755f2a471ed9e420b9e08539f b64208df0d8e94259783081084c5a731e0839542 e9951dbe37c9fb018e677d872df9f563a0861295 a07cff77d3bd452c3c4b99bf93503f727bf768cb 72fc2ceaa6ae472a809b4d5c02be98c44388c1b7 c02b63fb60458ec750e5991a7491235861c40061 69b6572338396134a3e20189cb35445d68757ebb 25d6abb951e111fd4da1130fef16749ae6981540 887332f9c7bf0d75f53f88a9739b77b12463d636 21f1fa82a8c7bd1b077f0289141972ed619c5a5f 520040dc4a287fd62d7d5161c083cee990c3d6e6 8885a51347a768d8a9125d573963d12ac67d4715 2d5bd21f31e2a608120ba262ba2af245526905d3 acc52bc90ef1d3cdfc3eef97bb3ac84bfc96cb4c 3a9edf9aad43c3e8ba724571da5381f821f1dc56 b6722aa7527abc71cb46ab75e4b875c288408d52 d324014d42bc759b6a6faa594bdecce054e294c1 3df16c0b70f734f5260bfde0f68239976d6a5842 70fceaa2fe581ed41408faa368ff3f6833fd463c cfc9da22f58659e57d20d76c1c45b91da9dca789 4478ba258e45559ac97353ab27951e84dd9865c1 8a169390c9ef4d8a43b604558c4194a052473c0c f89f7a54c25eb202e70225713ed39687be048e26 4fcf20d1d120985a6056ef8e1861738c2e903660 64731a8e9fce07a7c34374dc0a6bb6ed8b5f6183 e1e34cdc375baf2d1d5a2266ae0faa885987ab37 eef527723f02abcdb301b02cae059b123f277d26 43be3507c04b56938e985047f2ab55147ed8ddd2 83a4549e9baa252d0fb92d14e5a39119b8583813 15c3eaafbb3a376998e9c5eb36cb24816dad5447 f1ff598e2aca810c3a0540d6a764787d31890741 2334f4e64582a518e4d5a7627472a0d817b147ef 067648cd2bdc4776cb69c6554ee9d799e0b201c7 bc8745851e3005fd98c45fe06fc9d4d92c68fa53 716cf7d342466235d3117db5da788704cbf2853d 38c78a968259963d29559096dda575237039c561 b9f531a0e81ebf7a0dfeac00d557632546b12f56 ed566a87232fddde73481efe2dfcefceca5e49e4 69e9651c1ae0542e52f5ea924b9e286584446607 847b93c7400f82225057e8b71938eb8ccd5d23be 13b2587d4f55d64a1381c60ac34acf4abe6bb1e8 be2443e0c5f021bb98f92d72191c6c55a031873f 0556d9e6f1c0951e6e4026efe3b176407b82fc7b 18f83c12a04f934eda74fed77055073075bc4275 52c04e1e390e0008580eca7343f5c04aed3d1323 bededeccc51cc766ed48ce861a2a411ad8d22a87 6898bdca94cde73bd8d8b88d99153a731f6a7a6b dde38fda6eacf453cb48f75b7579647ceb75e9fd e60591919850a79a483ec3c138fce96f8e1edb57 b8dc6b241204f5348563a23f51765234ef19f044 13c1f008c0d8beca934ebfd347dc8354f4c9db05 7161dcd42653452a2373a7595a7020d0a59722f4 c031662fd0bf1bc366185fe85a342bf60a9fc0bc 10dbd1edd19008bc8eaeb55446e1e5fd87a12814 438abad27c797ca806938188f725fb0e36aa9fb9 36e55720b66743d161330183693949e4f8503cc7 01143089f08c662a75f5af47fc2a8a3f8ae2afd6 9b9845e43e08e357588bb6a2ca6bfc15ce2dcd73 577b3924408cd1ffa7d2559999751a9ced597882 31538a79a90653afb8bc7744506989c8811a800d 99649d78927bb911b8a9022c8f362e0a7d9c7ea9 b7ccb9d06a897a384b71ccb959b431168ca07e03 537bb7a8aee278d285cb77669fd9258dfaa3222f 67949d96a7c49b95801723e8cfdf327e907822cb 9e3893cc29dbcfd53d89abc679d0207cf2492999 251335cdf35d4ff1fcae9c73f77136c9b85e7d96 6ff0bb786c43ac3348dec6a977feb36af8bc4bcf c468a36903aea9ddac12b25c93cc5b65f293d6b9 a2c890c1e104140f83209c8d1e8ee298b346e38d 5f9f827fd4effe08d544964db349b56519952da6 78532a0c09c33a24715ae5ff7f446f1de488a24b 7e3d265469996efc7e720685be9b2c524eb7434b a0b7fb9bb2a6f446a0018a89bd8b50f756a0fe1c 2e6a2cf9c65e92db51edfdec6fbace8e49e90c7a e84ec36a620a4922ddcb9cdce9ddabc2573ee1da 44a230937b6dc320aad8b18828060e3e916eee03 2ec86fc20a49020a52cbec2727aca966642f9fac df5e4764870e8ad1d8b206cb3475a073bc034e48 c1dc5021ac2534ea7bf52246f13c19941b791efa 7e9ccbe68fe5215df9bd8e424195e1abf56f7286 f6bfb4ce00d27c4bc11615a5426065749e72b70a 888d66a2376f0da076ec312ef5ca2d93fee0e2f9 e9e5c95058df1f409debeb6b05aa222b476d79f6 c4c3b06e83ce8f7f18e77a101656ba983fb0d0e3 a20b997b3430bd7dc94ffd587cd299efa467420e 98eab245d3c3377af0c3da6880bb8ede80cb0925 c3e2013b615dd449113fe8fce0700319aa082020 07248fc5002fb109de8fc8e51e9d05329e0cd8cc 06fa3d32a73d59c7fec59a8682e3750150f84554 9ed951266244ad75454cfdb63ee0e872ca9ac43b e0fca9451146908402a8fbc770ff189aba636213 573be7e6023e73d736c341bdca1ee49594f56ee4 412555e0cdcd16439db56f6bd6ea56cedcda0883 d4c2b61c48cdd35275684e75427d2cf0d8d928de b86dc3926bfe5cd92400aa96c89b0255eba1d447 ee5c842e5303c70e88a1c68390c46db1f1689f19 a4ce2f652d76d033a79434416ff585cd15356a87 84d25135b3b2f9a30619f741d166fa1daa8298e5 df513b95ec24d279a10fbe358973662ce2c9c385 d8d6a6b2e639d2e29e166a3faf988b81388ae191 ff19f21913c508f5827df0e7e4c3a351c36711a0 552bc8aa4703b674747df36c591038da17c0c858 509ad75adbca85d606a3bd8bba727abf0751cebc 246dedaa091308f140a3cac41845f5e978492e37 4d70266274c1102c385dd00303d312d94453d19b 2333099c52566c6cf3d3f981588a26d4ff408155 0c14b1a962573ee125940f2008c646befe597226 683583faf2f4b00874f702429393b127aca8eef4 20c91c5e803090bd40fe3045a0d9fea0a68913e4 7f28a1c521341399da1f3559358f2abf876d34be 95e2d05e5d6b92a2f6b28e00f36064b7bf6b249a e561ce4b9259071f79d219dddf62f05cdd8dd07b 8e5d3042786917c04d3065755d81e7f8a751e529 245efd04e1456a71a6962acbb8ebc279481e9ffa 33c750f50ff8b6f1eae63140e8287c49a5130a60 39e7f25e0918d23e5b9ef5fc5049948b6f56525e ca3ca7b046ae94a152b1367ca982774345887e55 cdfc45859c299aa629482ee06614c9819346b444 f1276b25ae72e81cf044134bae92db6ef73be3a1 65edacf93484faf1dc3d11e555081d69556ccbc3 8b87d6b81408e5d6fe34f9e9fda1df2f4f2e5cd0 efd59e378c2ba8cae98fa664ae98521027e96b81 39915c9bc42f17619b1d2c46e6b3aea485c471a0 a18444984171ee86503d1250094965fb50a198ee 4ffe39573b537d638e4b39c9b5990c6566d62b09 cd0c5988020acc92ff98260e3304967bf31e4e87 f1d40d4824b568389cbc328cebb5734430b52e44 35b063a404457fdf956d1913738a3c8a66266cb4 be0eb9c92eb7a4fcd9d0d48568c8ed5e8326ef0b 9fe61171e515e7c77720675ecbe69731219b549c c96ef78b6d6d9184d8ec4cd18924a3049d388583 7c32b2dd9368137eca3cf0202360bbe0db62efbf ac90898f72b02bbc226a95deb40555c1fb8ac3a3 87fa906a84621295a76035d73dd6305c9cd2ea4a c0319e0eabbad87a3e153c23f2461c881153b984 b925dd78b813decf386139a15aa7bc6863ee7ae5 3e9f8c87e5a2acaa80f8bbb1d50fa82147942143 704975f58d7947721f530d202022721c16df466a 04f41e87a369828a698f62c32cabad34ed34a3e7 01150d7f8d27ad5efdb824da938c4a9fa562a036 1a743c9af39d0224b65ae504ae7e24d9fad56c2b 8a63b688ac49f19c259066fd100407edf3747f95 e6e2f2325a0a4eb14f10dd6df319b068761e9600 e854ea34cc481658ec61f4603d0438e075608c98)

for _commit in ${_hotfix_mainlinereverts[@]}; do
  _committorevert=$_commit nonuser_reverter
done
