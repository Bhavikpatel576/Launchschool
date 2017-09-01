class SecretHandshake
    COMMANDS = ['jump', 'close your eyes', 'double blink', 'wink'].freeze
    NUM_BITS = COMMANDS.size + 1
    MAX_DECIMAL = 2**(NUM_BITS + 1) - 1

    attr_reader :commands

    def initialize(n)
        validated_decimal = validate(n)
        bits = decimal_to_bits(validated_decimal)
        @commands = bits_to_commands(bits)
    end

    def validate(n)
        return 0 if n =~ /\D/ || n < 0 || n > MAX_DECIMAL
        n
    end

    def decimal_to_bits(n)
        format("%0#{NUM_BITS}b", n).split('')
    end

    def bits_to_commands(bits)
        command_list =
            COMMANDS.select.with_index do |_, i|
            bits[i + 1] == '1'
            end

        bits.first == '0' ? command_list.reverse : command_list
    end
end
