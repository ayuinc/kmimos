module Paths

  def visit_and_assert(path)
    visit(path)
    current_path_is(path)
  end

  def current_path_is(path)
    URI.parse(current_url).path.should eq(path)
  end
end

World(Paths)
