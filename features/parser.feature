Feature: Parsing
  In order to seperate backend and frontend
  As a backend writer
  I want to get a parsetree

  Scenario: Simple Song
    Given the song
    """
    [D]Do what I say, [Em]or I will suffer
    """

    When I parse it
    Then the parsetree should be
    """
    [
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer']
      ]
    ]
    """

  Scenario: Simple Song Multiline
    Given the song 
    """
    [D]Do what I say, [Em]or I will suffer
    [D]Do what I say, [Em]or I will suffer
    """

    When I parse it
    Then the parsetree should be
    """
    [
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer'],
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer']
      ]
    ]
    """

  Scenario: Song with two sections
    Given the song 
    """
    [D]Do what I say, [Em]or I will suffer
    [D]Do what I say, [Em]or I will suffer

    [D]Do what I say, [Em]or I will suffer
    [D]Do what I say, [Em]or I will suffer
    """

    When I parse it
    Then the parsetree should be
    """
    [
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer'],
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer']
      ],
      [
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer'],
        ['[D]', 'Do what I say, ', '[Em]', 'or I will suffer']
      ]
    ]
    """
