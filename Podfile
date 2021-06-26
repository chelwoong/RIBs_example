# platform :ios, '11.0'

use_frameworks!
inhibit_all_warnings!

def common_pods
  pod 'RIBs', :git=> 'https://github.com/uber/RIBs', :tag => '0.9.2'
  pod 'RxSwift'
  pod 'RxRelay'
  pod 'SnapKit', '~> 4.0.0'
  pod 'RxCocoa'
end

target 'TicTacToe' do
  common_pods
end

target 'TicTacToeTests' do
  common_pods
end


