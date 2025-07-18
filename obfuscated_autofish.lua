
local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'

function dec(data)
    data = data:gsub('[^'..b..'=]', '')
    return (data:gsub('.', function(x)
        if x == '=' then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i - f%2^(i-1) > 0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if #x ~= 8 then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
        return string.char(c)
    end))
end

loadstring(dec("Ci0tIFNlcnZpY2VzCmxvY2FsIFBsYXllcnMgPSBnYW1lOkdldFNlcnZpY2UoIlBsYXllcnMiKQpsb2NhbCBSZXBsaWNhdGVkU3RvcmFnZSA9IGdhbWU6R2V0U2VydmljZSgiUmVwbGljYXRlZFN0b3JhZ2UiKQpsb2NhbCBwbGF5ZXIgPSBQbGF5ZXJzLkxvY2FsUGxheWVyCi4uLgotLSBSZXN0b3JlIEdVSSB3aXRoIGhvdGtleSAob3B0aW9uYWwpCmdhbWU6R2V0U2VydmljZSgiVXNlcklucHV0U2VydmljZSIpLklucHV0QmVnYW46Q29ubmVjdChmdW5jdGlvbihpbnB1dCwgcHJvY2Vzc2VkKQogaWYgbm90IHByb2Nlc3NlZCBhbmQgaW5wdXQuS2V5Q29kZSA9PSBFbnVtLktleUNvZGUuRiB0aGVuCiAgZnJhbWUuVmlzaWJsZSA9IHRydWUKIGVuZAplbmQpCg=="))()
