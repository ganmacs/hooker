describe Hooker do
  let(:klass) do
    Class.new do
      include Hooker
      before_hooker :a, :b
      after_hooker :a, :c

      def a
        puts 'in a'
      end

      def b
        puts 'in b'
      end

      def c
        puts 'in c'
      end
    end
  end
  it { expect { klass.new.a }.to output("in b\nin a\nin c\n").to_stdout }
end
