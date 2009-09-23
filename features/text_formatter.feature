Feature: Text Output
  In order to view the chord files
  As a user
  I want to get a text output

  Scenario: Text Output of a simple Song
    Given the parsetree
    """
    [
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer']
      ]
    ]
    """

    When I format it as text
    Then the output should be
    """
    [D]            [Em]
    Do what I say, or I will suffer

    """

  Scenario: Text Output of a simple Song with one Section and two lines
    Given the parsetree
    """
    [
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer'],
        ['Do what ', '[D]', 'I say, ', '[Em]', 'or I will suffer']
      ]
    ]
    """

    When I format it as text
    Then the output should be
    """
    [D]            [Em]
    Do what I say, or I will suffer
            [D]    [Em]
    Do what I say, or I will suffer

    """

  Scenario: Text Output of a simple Song with two Section and two lines
    Given the parsetree
    """
    [
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer'],
        ['Do what ', '[D]', 'I say, ', '[Em]', 'or I will suffer']
      ],
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer'],
        ['Do what ', '[D]', 'I say, ', '[Em]', 'or I will suffer']
      ]
    ]
    """

    When I format it as text
    Then the output should be
    """
    [D]            [Em]
    Do what I say, or I will suffer
            [D]    [Em]
    Do what I say, or I will suffer

    [D]            [Em]
    Do what I say, or I will suffer
            [D]    [Em]
    Do what I say, or I will suffer

    """

  Scenario: Title
    Given the title Awesome Song
    And the parsetree
    """
    [
      [
        ['Text']
      ]
    ]
    """

    When I format it as text
    Then the output should be
    """
    ==============
     Awesome Song
    ==============
    
    Text

    """
