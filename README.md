<p align="center">
  config-cmake-xcodeproj
</p>

<h1>
  <p align="center">
    Synopsis
  </p>
</h1>

<p align="center">
  Generates .xcodeproj bundle template with symlinks to Xcode IDE <br> using <i><b>cmake</b></i> and <i><b>xcodebuild</b></i> -- all from the command line. <br>
</p>

<h2> 
  <p align="center"> <b>
    - How It Works - 
  </p>
</h2>

  
Configure for Xcode:

    cmake -S . -B xbuild -GXcode
    
Build XCode Project:

    (cd xbuild; xcodebuild build)
