class BadgeService
  RULES = {
    attempt: Badges::AttemptRuleSpecification,
    catrgory: Badges::CategoryRuleSpecification,
    level: Badges::LevelRuleSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage    
  end

  def call
    Badge.find_each do |badge|
      rule = RULES[badge.rule_name.to_sym].new(@test_passage, badge.rule_value)
      add_badge(badge) if rule.success?
    end
  end

  private

  def add_badge(badge)
    @test_passage.user.badges << badge
  end
end
