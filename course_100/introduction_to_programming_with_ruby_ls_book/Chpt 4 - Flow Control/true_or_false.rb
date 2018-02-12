# Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.

1. (32 * 4) >= 129                                                # => false (correct)
2. false != !true                                                 # => false (correct)

# This evaluates to false as true and 4, when compared, are not equal
# When used as conditions in flow control, they will both evaluate to true - but they are not the same when compared.
3. true == 4                                                      # => true (incorrect)
4. false == (847 == '874')                                        # => true (correct)

# Here just one of the conditions have to be true in order for the whole condition to evaluate to true
# Everything evaluates to false - except (328 / 4) == 82) => true - which means this is true
5. (!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false    # => true (correct)
