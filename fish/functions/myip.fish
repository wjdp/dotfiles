# Defined in - @ line 1
function myip --wraps='dig @resolver4.opendns.com myip.opendns.com +short' --description 'alias myip dig @resolver4.opendns.com myip.opendns.com +short'
  dig @resolver4.opendns.com myip.opendns.com +short $argv;
end
