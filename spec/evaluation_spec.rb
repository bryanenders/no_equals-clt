require 'spec_helper'

module NoEquals::CLT
  shared_examples 'operation' do |input, use_case, description|
    context "with '#{input}'" do
      it description do
        expect(use_case).to receive(:execute)
        Evaluation.perform(input)
      end
      it 'aborts on failure' do
        allow(use_case).to receive(:execute) { |&block| block.call }
        expect { Evaluation.perform(input) }.to raise_error(SystemExit)
      end
    end
  end

  describe Evaluation do
    describe '::perform' do
      it "exits with 'q'" do
        expect { Evaluation.perform('q') }.to raise_error(SystemExit, 'exit')
      end
      include_examples 'operation', '+', NoEquals::Add,      'adds'
      include_examples 'operation', '-', NoEquals::Subtract, 'subtracts'
      include_examples 'operation', '*', NoEquals::Multiply, 'multiplies'
      include_examples 'operation', '/', NoEquals::Divide,   'divides'
      it 'pushes numbers' do
        [1, 2, 0.34, -5, -6, -0.78].each do |value|
          expect(NoEquals::Push).to receive(:execute).with(value)
        end
        Evaluation.perform('1')
        Evaluation.perform('02.0')
        Evaluation.perform('.340')
        Evaluation.perform('-5')
        Evaluation.perform('-006.00')
        Evaluation.perform('-.7800')
      end
      it 'aborts with unexpected input' do
        expect { Evaluation.perform('foo') }.to raise_error(SystemExit)
      end
    end
  end
end
