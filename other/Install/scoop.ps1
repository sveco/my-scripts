#Installing scoop

#enable execution policy for current user
#Set-ExecutionPolicy RemoteSigned -scope CurrentUser
#set scoop target folder environment variable
#[Environment]::SetEnvironmentVariable("SCOOP", "D:\PortableApps\Scoop\", "Machine")
#install scoop
iex (new-object net.webclient).downloadstring('https://get.scoop.sh')
#add extras bucket
& scoop bucket add extras
#add my bucket
& scoop bucket add my-bucket https://github.com/sveco/my-scripts/tree/work
& scoop update