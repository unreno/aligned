class Alignment < ApplicationRecord

#	#	c.scan(/[^[:alpha:]]*[[:alpha:]]/).collect(&:to_i)
#	def percent_m
#		ashes = cigar.scan(/[^[:alpha:]]*[[:alpha:]]/)
#		length = ashes.collect(&:to_i).sum
#		m_length = ashes.select{|a|a[/\d+M/]}.collect(&:to_i).sum
#		100.0 * m_length / length
#	end
#
#	def reverse?
#		( flags & 16 ) == 16
#	end

#	Flags:
#		1    0x1   PAIRED        .. paired-end (or multiple-segment) sequencing technology
#		2    0x2   PROPER_PAIR   .. each segment properly aligned according to the aligner
#		4    0x4   UNMAP         .. segment unmapped
#		8    0x8   MUNMAP        .. next segment in the template unmapped
#		16   0x10  REVERSE       .. SEQ is reverse complemented
#		32   0x20  MREVERSE      .. SEQ of the next segment in the template is reversed
#		64   0x40  READ1         .. the first segment in the template
#		128  0x80  READ2         .. the last segment in the template
#		256  0x100 SECONDARY     .. secondary alignment
#		512  0x200 QCFAIL        .. not passing quality controls
#		1024 0x400 DUP           .. PCR or optical duplicate
#		2048 0x800 SUPPLEMENTARY .. supplementary alignment

end
