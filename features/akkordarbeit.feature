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
        ["[D]", "Do what I say, ", "[Em]", "or I will suffer"]
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
        ["[D]", "Do what I say, ", "[Em]", "or I will suffer"],
        ["[D]", "Do what I say, ", "[Em]", "or I will suffer"]
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
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"],
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"]
    ],
    [
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"],
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"]
    ]
    ]
    """

Feature: Text Output
  In order to view the chord files
  As a user
  I want to get a text output


  Scenario: Text Output of a simple Song
    Given the parsetree
    """
    [
     [
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"]
     ]
    ]
    """

    When I format it
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
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"],
      ["Do what ", "[D]", "I say, ", "[Em]", "or I will suffer"]
     ]
    ]
    """

    When I format it
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
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"],
      ["Do what ", "[D]", "I say, ", "[Em]", "or I will suffer"]
     ],
     [
      ["[D]", "Do what I say, ", "[Em]", "or I will suffer"],
      ["Do what ", "[D]", "I say, ", "[Em]", "or I will suffer"]
     ]
    ]
    """

    When I format it
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
