module UsersHelper
	def test
		"HELLO, WORLD"
	end
	# def headline(headline)
	# 	%Q{
	# 		<h1>#{headline}</h1>
	# 	}.html_safe
	# end
	def header(headline)
		content_tag :h1, headline
	end

	def form
	end
end
