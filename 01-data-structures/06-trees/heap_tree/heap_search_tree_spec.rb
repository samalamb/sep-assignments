include RSpec

require_relative 'heap_search_tree'

RSpec.describe HeapSeachTree, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:tree) { HeapSeachTree.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node and it swaps with the root" do
      tree.insert(root, martian)
      expect(tree.root.title).to eq "The Martian"
    end

    it "properly inserts a new node as a left-left child" do
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, braveheart)
      tree.insert(tree.root, pacific_rim)
      expect(tree.root.left.left.title).to eq "Pacific Rim"
    end

    it "properly inserts a new node as a left-right child" do
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      expect(tree.root.right.title).to eq "Inception"
    end
  end

  describe "#find" do
    it "should find the proper node" do
      tree.insert(tree.root, jedi)
      tree.insert(tree.root, donnie)
      tree.insert(tree.root, inception)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      expect(tree.find(tree.root, inception.title).title).to eq("Inception")
    end

    it "should find the left node" do
      tree.insert(tree.root, pacific_rim)
      expect(tree.find(tree.root, pacific_rim.title).title).to eq("Pacific Rim")
    end
  end

  describe "#delete" do
    it "should find and delete the proper node" do
      tree.insert(tree.root, inception)
      tree.delete(tree.root, inception.title)
      expect(tree.find(tree.root, inception.title)).to eq(nil)
    end

    it "should be able to find a node and delete in a long list" do
      tree.insert()
    end
  end

  describe "#print" do
    it "should print expected output" do
      expected_output = "Mad Max 2: The Road Warrior: 98\nStar Wars: A New Hope: 93\nStar Wars: The Empire Strikes Back: 94\nDistrict 9: 90\nThe Martian: 92\nThe Matrix: 87\nPacific Rim: 72\n"
      tree.insert(tree.root, pacific_rim)
      tree.insert(tree.root, district)
      tree.insert(tree.root, hope)
      tree.insert(tree.root, martian)
      tree.insert(tree.root, mad_max_2)
      tree.insert(tree.root, empire)
      expect{ tree.printf }.to output(expected_output).to_stdout
   end
  end
end
