class BadgeService
  RULES = {
    attempt: Badges::AttemptRuleSpecification,
    category: Badges::CategoryRuleSpecification,
    level: Badges::LevelRuleSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage    
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_name.to_sym].new(@test_passage, badge.rule_value)
      @test_passage.user.badges.push(badge) if rule.success?
    end
  end
end
