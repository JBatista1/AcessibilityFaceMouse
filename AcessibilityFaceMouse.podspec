#
#  Be sure to run `pod spec lint AcessibilityFaceMouse.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see https://guides.cocoapods.org/syntax/podspec.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |spec|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  spec.name         = "AcessibilityFaceMouse"
  spec.version      = "0.0.4"
  spec.summary      = "Pega a movimentação da face do usuário e cria um cursor virtual no dispositivo. (Somente iphones X ou superior)"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  spec.description  = <<-DESC
  A AcessibilityFaceMouse é um pod com intuito de possibilitar que pessoas com movimentação debilitada dos membros superiores, possam interagir com aplicativos sem a utilização de algum acessório. 
  Ele pega a movimentação da face do usuário e cria uma representação desses movimentos em forma de cursor na tela. Ao passar por cima de alguma view, como um botão, ele pode usar gestos para ativar aquela ação.
    Temos quatro tipos de gestos: Piscar olho direito; piscar olho esquerdo; mostrar a língua ou com um comando de voz. Esse comando de voz pode receber quatro ações, a primeira é de toque em algo, segundo de voltar
    na navegação com navigationcontroller, o de próximo e de anterior, para usar em views que tem scroll, como celular e collectionsviews. Para demais ações, deve-se integrar componentes que possam facilitar na hora da utilização
    da aplicação.
    A ação com voz ainda está em fase de testes. O mais recomendado é o da língua, pois tiveram os melhores resultados, diminuindo assim o esforço repetitivo.
Para utilizar basta mudar a herança de uma classe que herda da viewcontroller  pela AccessibilityFaceAnchorViewController e iniciar os recursos necessarios. 
Para uma melhor utilização do usuário existe a classe AcessibilityGetSensitivityViewController, que tem função de capturar as limitações da face do usuário e assim se adequando ao seu ritmo.

                   DESC

  spec.homepage     = "https://github.com/JBatista1/AcessibilityFaceMouse"
  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Licensing your code is important. See https://choosealicense.com for more info.
  #  CocoaPods will detect a license file if there is a named LICENSE*
  #  Popular ones are 'MIT', 'BSD' and 'Apache License, Version 2.0'.
  #

  spec.license      = "Amigo, Faça o que você quiser com intuito de ajudar as pessoas. Só lembra de me mencionar no copyright"
  # spec.license      = { :type => "MIT", :file => "FILE_LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the authors of the library, with email addresses. Email addresses
  #  of the authors are extracted from the SCM log. E.g. $ git log. CocoaPods also
  #  accepts just a name if you'd rather not provide an email address.
  #
  #  Specify a social_media_url where others can refer to, for example a twitter
  #  profile URL.
  #

  spec.author             = { "João Batista Romão" => "j.batista.damasceno@icloud.com" }
  # Or just: spec.author    = "João Batista"
  # spec.authors            = { "João Batista" => "joao.damasceno@bs2tecnologia.com.br" }
  # spec.social_media_url   = "https://twitter.com/João Batista"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If this Pod runs only on iOS or OS X, then specify the platform and
  #  the deployment target. You can optionally include the target after the platform.
  #

  # spec.platform     = :ios
  # spec.platform     = :ios, "5.0"

  #  When using multiple platforms
  spec.ios.deployment_target = "13.0"
  # spec.osx.deployment_target = "10.7"
  # spec.watchos.deployment_target = "2.0"
  # spec.tvos.deployment_target = "9.0"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Specify the location from where the source should be retrieved.
  #  Supports git, hg, bzr, svn and HTTP.
  #

  spec.source       = { :git => "https://github.com/JBatista1/AcessibilityFaceMouse.git", :tag => "#{spec.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  CocoaPods is smart about how it includes source code. For source files
  #  giving a folder will include any swift, h, m, mm, c & cpp files.
  #  For header files it will include any header in the folder.
  #  Not including the public_header_files will make all headers public.
  #

  spec.source_files  = "AcessibilityFaceMouse/**/*.{h,m,.swift}", "AcessibilityFaceMouse", "Exemples/**/*.{h,m,.swift}"

  # spec.public_header_files = "Classes/**/*.h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
