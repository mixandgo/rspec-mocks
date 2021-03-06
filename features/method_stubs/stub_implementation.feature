Feature: stub with substitute implementation

  You can stub an implementation of a method (a.k.a. fake) by passing a block
  to the `stub` method.

  Scenario: stub implementation using `expect` syntax
  Given a file named "stub_implementation_spec.rb" with:
    """ruby
    describe "a stubbed implementation" do
      it "works" do
        object = Object.new
        allow(object).to receive(:foo) do |arg|
          if arg == :this
            "got this"
          elsif arg == :that
            "got that"
          end
        end

        expect(object.foo(:this)).to eq("got this")
        expect(object.foo(:that)).to eq("got that")
      end
    end
    """
  When I run `rspec stub_implementation_spec.rb`
  Then the output should contain "1 example, 0 failures"

  Scenario: stub implementation using `should` syntax
    Given a file named "stub_implementation_spec.rb" with:
      """ruby
      describe "a stubbed implementation" do
        it "works" do
          object = Object.new
          object.stub(:foo) do |arg|
            if arg == :this
              "got this"
            elsif arg == :that
              "got that"
            end
          end

          expect(object.foo(:this)).to eq("got this")
          expect(object.foo(:that)).to eq("got that")
        end
      end
      """
    When I run `rspec stub_implementation_spec.rb`
    Then the output should contain "1 example, 0 failures"
