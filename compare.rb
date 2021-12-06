require 'digest/md5'

files1 = Dir.glob('files1/*').map { |f| File.basename(f) }
files2 = Dir.glob('files2/*').map { |f| File.basename(f) }
files = files1.concat(files2)

files.map { |f| f.split('_') }
     .each_with_object({}) { |cur, acc| acc[cur[0]] = [*acc[cur[0]], cur[1]].uniq }
     .filter { |_k, v| v.size != 1 }
     .each { |k, v| p "Duplicate file #{k}_#{v[0]}" }
