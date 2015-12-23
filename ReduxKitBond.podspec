Pod::Spec.new do |spec|
  spec.name              = 'ReduxKitBond'
  spec.version           = '0.1.0'
  spec.summary           = 'Bond bindings for ReduxKit'
  spec.homepage          = 'https://github.com/ReduxKit/ReduxKitBond'
  spec.license           = { :type => 'MIT', :file => 'LICENSE' }
  spec.authors           = { 'Aleksander Herforth Rendtslev' => 'kontakt@karemedia.dk', 'Karl Bowden' => 'karl@karlbowden.com' }
  spec.source            = { :git => 'https://github.com/ReduxKit/ReduxKitBond.git', :tag => spec.version.to_s }
  spec.source_files      = 'ReduxKitBond'
  spec.dependency          'ReduxKit', '~> 0.1'
  spec.dependency          'Bond', '~> 4.0'
  spec.ios.deployment_target     = '8.0'
  spec.osx.deployment_target     = '10.10'
  #spec.tvos.deployment_target    = '9.0'
end
