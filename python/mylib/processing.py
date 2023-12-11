def count_words(text):
    """
    Count the number of words in the given text.
    
    :param text: String containing the text to be processed.
    :return: An integer representing the word count.
    """
    words = text.split()
    return len(words)
