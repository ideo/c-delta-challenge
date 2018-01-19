purpose = CreativeQuality.create(
  name: 'Purpose',
  description: 'The degree to which there is alignment about a meaningful change that leadership and employees want to make in the world. Scoring high on purpose requires that the purpose is clear, inspires passion in employees, and helps to inform most major decisions.',
  color: '#9e5fa0'
)
empowerment = CreativeQuality.create(
  name: 'Empowerment',
  description: 'The degree to which the organization provides a clear path for employees to create change by lending them autonomy. These organizations create meaningful jobs where employees are confident that they can improve things for the better if they do their job well.',
  color: '#5bc9b0'
)
collaboration = CreativeQuality.create(
  name: 'Collaboration',
  description: 'The degree to which employees of different roles and departments work together to bring new ideas forward. Organizations with a high score tend to create multi-disciplined teams where members with different skills respect and value each other’s craft.',
  color: '#e6c937'
)

questions_attributes = [
  {
    title: "If you had to be candid, how would you describe your company culture?",
    position: 0,
    question_choices_attributes: [
      { text: 'Energizing', creative_quality: empowerment, score: 4 },
      { text: 'Draining', creative_quality: empowerment, score: -1 }
    ]
  },
  {
    title: 'How do you feel about this statement? "Leadership clearly articulates our company\'s purpose, beyond making money."',
    position: 1,
    question_choices_attributes: [
      { text: 'Strongly Disagree', creative_quality: purpose, score: -1 },
      { text: 'Disagree', creative_quality: purpose, score: 0 },
      { text: 'Agree', creative_quality: purpose, score: 2 },
      { text: 'Strongly Agree', creative_quality: purpose, score: 4 }
    ]
  },
  {
    title: "Finish this sentence: My boss tends to ...",
    position: 2,
    question_choices_attributes: [
      { text: 'Take Credit', creative_quality: empowerment, score: -1 },
      { text: 'Share Credit', creative_quality: empowerment, score: 5 }
    ]
  },
  {
    title: 'When working in a group we usually...',
    position: 3,
    question_choices_attributes: [
      { text: "Use our company's purpose to make decisions", creative_quality: purpose, score: 1 },
      { text: "Don't think about our company's purpose because it's not relevant to us", creative_quality: purpose, score: -2 },
      { text: "Don't know what our company's purpose is", creative_quality: purpose, score: -4 }
    ]
  },
  {
    title: "When developing and implementing solutions, how do different roles tend to work together?",
    position: 4,
    question_choices_attributes: [
      { text: 'In Parallel—different functions work at the same time to complete?', creative_quality: collaboration, score: 7 },
      { text: 'In Series—like an assembly line.', creative_quality: collaboration, score: -1 }
    ]
  },
  {
    title: 'When developing and implementing solutions, how often do different roles update each other?',
    position: 5,
    question_choices_attributes: [
      { text: 'Multiple times a day', creative_quality: collaboration, score: 20 },
      { text: 'Daily', creative_quality: collaboration, score: 16 },
      { text: 'Weekly', creative_quality: collaboration, score: 12 },
      { text: 'Monthly', creative_quality: collaboration, score: 8 },
      { text: 'Every few months', creative_quality: collaboration, score: 4 },
      { text: 'Rarely', creative_quality: collaboration, score: 0 }
    ]
  },
  {
    title: 'If my team does well, we can...',
    position: 6,
    question_choices_attributes: [
      { text: 'Change the world', creative_quality: purpose, score: 2 },
      { text: 'Change our industry', creative_quality: purpose, score: 1 },
      { text: 'Radically change our department', creative_quality: purpose, score: -3 },
      { text: 'Moderately change our department', creative_quality: purpose, score: -5 },
      { text: 'It will be hard to see any change', creative_quality: purpose, score: -7 }
    ]
  },
  {
    title: 'If my team wanted to make a change to a current process or product...',
    position: 7,
    question_choices_attributes: [
      { text: 'We could release it to customers without outside approval', creative_quality: empowerment, score: 3 },
      { text: 'We could test the change with a significant portion of our customers without outside approval', creative_quality: empowerment, score: 3 },
      { text: 'We would need approval by our company\s leadership', creative_quality: empowerment, score: -1 },
      { text: 'We would not be able to make such changes', creative_quality: empowerment, score: -1 }
    ]
  },
  {
    title: 'How much do you agree or disagree with the following statement: People at my company feel comfortable challenging the status quo.',
    position: 8,
    question_choices_attributes: [
      { text: 'Strongly Agree', creative_quality: empowerment, score: 4 },
      { text: 'Agree', creative_quality: empowerment, score: 3 },
      { text: 'Disagree', creative_quality: empowerment, score: 0 },
      { text: 'Strongly Disagree', creative_quality: empowerment, score: -1 }
    ]
  },
  {
    title: 'How much do you agree or disagree with the following statement: People at my company feel comfortable sharing new ideas.',
    position: 9,
    question_choices_attributes: [
      { text: 'Strongly Agree', creative_quality: empowerment, score: 4 },
      { text: 'Agree', creative_quality: empowerment, score: 3 },
      { text: 'Disagree', creative_quality: empowerment, score: 1 },
      { text: 'Strongly Disagree', creative_quality: empowerment, score: 0 }
    ]
  }
]

Question.create!(questions_attributes)

seed = ENV['seed'] || Random.new_seed
random = Random.new(seed)
ordered_questions = Question.order(position: :asc).includes(:question_choices)

100.times do
  response = Response.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  ordered_questions.each do |question|
    # Don't answer questions ~ 10% of the time
    next if random.rand(100) < 10

    question_choice_i = random.rand(question.question_choices.size)
    question_choice = question.question_choices[question_choice_i]

    QuestionResponse.create(
      response: response,
      question_choice: question_choice
    )
  end
end
