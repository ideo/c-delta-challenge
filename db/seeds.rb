purpose = CreativeQuality.create(
  name: 'Purpose',
  description: 'The degree to which there is alignment about a meaningful change that leadership and employees want to make in the world. Scoring high on purpose requires that the purpose is clear, inspires passion in employees, and helps to inform most major decisions.'
)
empowerment = CreativeQuality.create(
  name: 'Empowerment',
  description: 'The degree to which the organization provides a clear path for employees to create change by lending them autonomy. These organizations create meaningful jobs where employees are confident that they can improve things for the better if they do their job well.'
)
collaboration = CreativeQuality.create(
  name: 'Collaboration',
  description: 'The degree to which employees of different roles and departments work together to bring new ideas forward. Organizations with a high score tend to create multi-disciplined teams where members with different skills respect and value each other’s craft.'
)

questions_attributes = [
  {
    title: "If you had to be candid, how would you describe your company culture?",
    choices_attributes: [
      { text: 'Energizing', creative_quality: empowerment, score: 1 },
      { text: 'Draining', creative_quality: empowerment, score: -1 }
    ]
  },
  {
    title: 'How do you feel about this statement? "Leadership clearly articulates our company\'s purpose, beyond making money."',
    choices_attributes: [
      { text: 'Strongly Disagree', creative_quality: purpose, score: -3 },
      { text: 'Disagree', creative_quality: purpose, score: -2 },
      { text: 'Agree', creative_quality: purpose, score: 2 },
      { text: 'Strongly Agree', creative_quality: purpose, score: 3 }
    ]
  },
  {
    title: "Finish this sentence: My boss tends to ...",
    choices_attributes: [
      { text: 'Take Credit', creative_quality: empowerment, score: -1 },
      { text: 'Share Credit', creative_quality: empowerment, score: 1 }
    ]
  },
  {
    title: 'When working in a group we usually...',
    choices_attributes: [
      { text: "Use our company's purpose to make decisions", creative_quality: purpose, score: 1 },
      { text: "Don't think about our company's purpose because it's not relevant to us", creative_quality: purpose, score: -1 },
      { text: "Don't know what our company's purpose is", creative_quality: purpose, score: -1 }
    ]
  },
  {
    title: "When developing and implementing solutions, how do different roles tend to work together?",
    choices_attributes: [
      { text: 'In Parallel—different functions work at the same time to completed?? different aspects of the project.', creative_quality: collaboration, score: 1 },
      { text: 'In Series—like an assembly line. Different functions completed?? different aspects of the project in sequence, one role handing off to the next role when done with their portion.', creative_quality: collaboration, score: -1 }
    ]
  },
  {
    title: 'When developing and implementing solutions, how often do different roles update each other?',
    choices_attributes: [
      { text: 'Multiple times a day', creative_quality: collaboration, score: 3 },
      { text: 'Daily', creative_quality: collaboration, score: 2 },
      { text: 'Weekly', creative_quality: collaboration, score: 1 },
      { text: 'Monthly', creative_quality: collaboration, score: -1 },
      { text: 'Every few months', creative_quality: collaboration, score: -2 },
      { text: 'Rarely', creative_quality: collaboration, score: -3 }
    ]
  },
  {
    title: 'If my team does well, we can...',
    choices_attributes: [
      { text: 'Change the world', creative_quality: purpose, score: 3 },
      { text: 'Change our industry', creative_quality: purpose, score: 2 },
      { text: 'Radically change our department', creative_quality: purpose, score: 1 },
      { text: 'Moderately change our department', creative_quality: purpose, score: -1 },
      { text: 'It will be hard to see any change', creative_quality: purpose, score: -2 }
    ]
  },
  {
    title: 'If my team wanted to make a change to a current process or product...',
    choices_attributes: [
      { text: 'We could release it to customers without outside approval', creative_quality: empowerment, score: 1 },
      { text: 'We could test the change with a significant portion of our customers without outside approval', creative_quality: empowerment, score: 1 },
      { text: 'We would need approval by our company\s leadership', creative_quality: empowerment, score: -1 },
      { text: 'We would not be able to make such changes', creative_quality: empowerment, score: -2 }
    ]
  },
  {
    title: 'How much do you agree or disagree with the following statement: People at my company feel comfortable challenging the status quo.',
    choices_attributes: [
      { text: 'Strongly Agree', creative_quality: empowerment, score: 2 },
      { text: 'Agree', creative_quality: empowerment, score: 1 },
      { text: 'Disagree', creative_quality: empowerment, score: -1 },
      { text: 'Strongly Disagree', creative_quality: empowerment, score: -2 }
    ]
  },
  {
    title: 'How much do you agree or disagree with the following statement: People at my company feel comfortable sharing new ideas.',
    choices_attributes: [
      { text: 'Strongly Agree', creative_quality: empowerment, score: 2 },
      { text: 'Agree', creative_quality: empowerment, score: 1 },
      { text: 'Disagree', creative_quality: empowerment, score: -1 },
      { text: 'Strongly Disagree', creative_quality: empowerment, score: -2 }
    ]
  }
]

Question.create!(questions_attributes)

100.times do
  response = Response.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  Question.includes(:choices).find_each do |question|
    # Don't answer questions roughly 2% of the time
    next if rand(100) < 2

    QuestionResponse.create(
      response: response,
      question_choice: question.choices.sample
    )
  end
end
