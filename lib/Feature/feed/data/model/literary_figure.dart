class LiteraryFigure {
  final String name;
  final String description;
  final String imageUrl;
  final String preview;

  LiteraryFigure({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.preview,
  });
}

final List<LiteraryFigure> literaryFigures = [
// Poets
... poets,

// Playwrights
... playwrights,

// Novelists
... novelists,
  ...novelists
];
final List<LiteraryFigure> poets = [
// Poets
LiteraryFigure(
name: 'William Wordsworth',
description: 'An English Romantic poet known for his influential role in launching the Romantic Age in English literature. He celebrated nature and the human spirit in his poetry.',
imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/8/81/William_Wordsworth_at_28_by_William_Shuter2.jpg',
preview: 'I wandered lonely as a cloud...',
),
LiteraryFigure(
name: 'Emily Dickinson',
description: 'An American poet famous for her unconventional style and introspective, often enigmatic poems dealing with themes of death and immortality.',
imageUrl: 'https://fcit.usf.edu/wp-content/uploads/2017/10/EmilyDickinsonPortrait-Full.jpg',
preview: 'Because I could not stop for Death—He kindly stopped for me—',
),
LiteraryFigure(
name: 'Robert Frost',
description: 'An American poet celebrated for his depictions of rural New England life and exploration of complex social and philosophical themes.',
imageUrl: 'https://ebbg7broonn.exactdn.com/wp-content/uploads/2023/06/Robert-Frost-Portrait-Square-1536x1536.jpg',
preview: 'Two roads diverged in a wood, and I—I took the one less traveled by...',
),
LiteraryFigure(
name: 'Maya Angelou',
description: 'An American poet and civil rights activist, known for her series of autobiographies starting with I Know Why the Caged Bird Sings.',
imageUrl: 'https://nclhof.org/wp-content/uploads/2012/10/angelou.jpg',
preview: 'You may shoot me with your words, you may cut me with your eyes...',
),
LiteraryFigure(
name: 'Langston Hughes',
description: 'An American poet and leading figure of the Harlem Renaissance, known for his works celebrating African American culture and experiences.',
imageUrl: 'https://historicmissourians.shsmo.org/wp-content/uploads/2020/12/hughes-libofcongress-lg.gif',
preview: 'What happens to a dream deferred? Does it dry up like a raisin in the sun?',
),
LiteraryFigure(
name: 'Sylvia Plath',
description: 'An American poet and novelist known for her confessional style, exploring themes of mental illness and identity.',
imageUrl: 'https://cdn.britannica.com/67/19067-050-843F2405/Sylvia-Plath.jpg',
preview: 'Out of the ash I rise with my red hair and I eat men like air.',
),
LiteraryFigure(
name: 'Pablo Neruda',
description: 'A Chilean poet and diplomat who won the Nobel Prize for Literature in 1971, known for his passionate and lyrical poetry.',
imageUrl: 'https://ebbg7broonn.exactdn.com/wp-content/uploads/2021/01/Pablo-Neruda-Portrait.jpg',
preview: 'I love you as certain dark things are to be loved, in secret, between the shadow and the soul.',
),
LiteraryFigure(
name: 'Walt Whitman',
description: 'An American poet and essayist, recognized for his work Leaves of Grass and his celebration of democracy and individualism.',
imageUrl: 'https://ebbg7broonn.exactdn.com/wp-content/uploads/2021/01/Walt-Whitman-Portrait.jpg',
preview: 'I celebrate myself, and sing myself...',
),
];
final List<LiteraryFigure> playwrights = [
// Playwrights
LiteraryFigure(
name: 'William Shakespeare',
description: 'An English playwright, poet, and actor, widely regarded as the greatest writer in the English language and the world’s greatest dramatist.',
imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/2/21/William_Shakespeare_by_John_Taylor%2C_edited.jpg',
preview: 'To be, or not to be, that is the question...',
),
LiteraryFigure(
name: 'Tennessee Williams',
description: 'An American playwright known for his plays such as A Streetcar Named Desire and The Glass Menagerie, which explore complex human emotions.',
imageUrl: 'https://ebbg7broonn.exactdn.com/wp-content/uploads/2023/10/Tennessee-Williams-Portrait.jpg',
preview: 'I have always depended on the kindness of strangers.',
),
LiteraryFigure(
name: 'Arthur Miller',
description: 'An American playwright famous for works such as Death of a Salesman and The Crucible, which address themes of social justice and personal morality.',
imageUrl: 'https://www.neh.gov/sites/default/files/styles/featured_image_page/public/2018-07/jeff-lect-2001arthurmiller.jpg',
preview: 'Attention must be paid.',
),
LiteraryFigure(
name: 'Henrik Ibsen',
description: 'A Norwegian playwright and poet, known for his plays A Doll’s House and Hedda Gabler, which are foundational works in modern drama.',
imageUrl: 'https://ebbg7broonn.exactdn.com/wp-content/uploads/2019/05/Henrik-Ibsen-Portrait.jpeg',
preview: 'The strongest man in the world is he who stands most alone.',
),
LiteraryFigure(
name: 'Samuel Beckett',
description: 'An Irish playwright and novelist, known for his play Waiting for Godot, a seminal work in the Theatre of the Absurd.',
imageUrl: 'https://assets.bigcartel.com/product_images/366408241/Samuel_Beckett.jpg',
preview: 'Nothing to be done.',
),

];
final List<LiteraryFigure> novelists = [
// Novelists
LiteraryFigure(
name: 'Jane Austen',
description: 'An English novelist known for her six major novels including Pride and Prejudice and Sense and Sensibility, which critique the British landed gentry.',
imageUrl: 'https://kindersleysocial.ca/wp-content/uploads/2021/09/jane-austen-640x774.jpg',
preview: 'It is a truth universally acknowledged, that a single man in possession of a good fortune, must be in want of a wife.',
),
LiteraryFigure(
name: 'Charles Dickens',
description: 'An English novelist and social critic known for his works such as A Tale of Two Cities and Great Expectations, which depict Victorian society.',
imageUrl: 'https://images.theconversation.com/files/311833/original/file-20200124-81336-lniamy.png',
preview: 'It was the best of times, it was the worst of times...',
),
LiteraryFigure(
name: 'Leo Tolstoy',
description: 'A Russian writer acclaimed for his epic novels War and Peace and Anna Karenina, which are considered masterpieces of realist fiction.',
imageUrl: 'https://www.onthisday.com/images/people/leo-tolstoy.jpg',
preview: 'All happy families are alike; each unhappy family is unhappy in its own way.',
),
LiteraryFigure(
name: 'George Orwell',
description: 'An English novelist and essayist known for his dystopian works 1984 and Animal Farm, which critique totalitarianism and social injustice.',
imageUrl: 'https://www.neh.gov/sites/default/files/styles/large/public/2019-01/2019_01-Winter_Orwell_01_0.jpg',
preview: 'Big Brother is watching you.',
),
LiteraryFigure(
name: 'Ernest Hemingway',
description: 'An American novelist known for his concise writing style and works such as The Old Man and the Sea and A Farewell to Arms.',
imageUrl: 'https://assets.editorial.aetnd.com/uploads/2017/03/was-ernest-hemingway-a-spys-featured-photo.jpg',
preview: 'He was an old man who fished alone in a skiff in the Gulf Stream and he had gone eighty-four days now without taking a fish.',
),
];
final List<LiteraryFigure> journalists = [
  // Journalists
  LiteraryFigure(
    name: 'Hunter S. Thompson',
    description: 'An American journalist and author known for his creation of Gonzo journalism, characterized by a first-person narrative and lack of objectivity.',
    imageUrl: 'https://cdn.britannica.com/76/91676-050-F65CE370/Hunter-S-Thompson.jpg',
    preview: 'We were somewhere around Barstow on the edge of the desert when the drugs began to take hold.',
  ),
  LiteraryFigure(
    name: 'Joan Didion',
    description: 'An American essayist, journalist, and novelist known for her clear-eyed observations of American life, particularly in her works The Year of Magical Thinking and The White Album.',
    imageUrl: 'https://static.wixstatic.com/media/99359a_01ca18399138441ab21fd49d83adfdf4~mv2.jpg/v1/fill/w_1349,h_820,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/99359a_01ca18399138441ab21fd49d83adfdf4~mv2.jpg',
    preview: 'We tell ourselves stories in order to live.',
  ),
  LiteraryFigure(
    name: 'H. L. Mencken',
    description: 'An American journalist, essayist, and critic known for his satirical commentary on American life and culture, especially in his book The American Language.',
    imageUrl: 'https://cdn.britannica.com/83/233683-050-1F3A0A0C/H-L-Mencken-1946.jpg',
    preview: 'Puritanism: The haunting fear that someone, somewhere, may be happy.',
  ),
  LiteraryFigure(
    name: 'Bob Woodward',
    description: 'An American investigative journalist best known for his role in reporting the Watergate scandal which led to the resignation of President Richard Nixon.',
    imageUrl: 'https://cdn.britannica.com/49/103149-050-C4FEB773/Bob-Woodward-2006.jpg',
    preview: 'The truth will always win.',
  ),
  LiteraryFigure(
      name: 'Carl Bernstein',
      description: 'An American investigative journalist and author, known for his work alongside Bob Woodward in uncovering the Watergate scandal.',
      imageUrl: 'https://www.wsb.com/wp-content/uploads/2021/06/Bernstein_Carl_HS-682x830.jpg',
      preview: 'Carl Bernstein, an iconic American investigative journalist, is celebrated for his pivotal role in uncovering the Watergate scandal alongside Bob Woodward.'
  )
];


