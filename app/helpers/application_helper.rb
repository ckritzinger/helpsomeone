module ApplicationHelper

  def default_amount
    Pledge::DEFAULT_PLEDGE_AMOUNT
  end

  def durations
    [
      ['One Month', 1],
      ['Three Months', 3],
      ['Six Months', 6],
      ['One Year', 12],
      ['Indefinitely', 0],
    ]
  end

  def cents_to_rands(cents)
    "R #{number_with_precision(0.01 * cents, precision: 2)}"
  end

  def email_subject(recipient)
    "I'd like to help #{recipient.name}"
  end

  def email_body(recipient)
    body = <<~MAIL
    Hello HelpSomebody

    I've decided that I want to help #{recipient.name} (##{recipient.id}),
    by providing them with R#{Pledge::DEFAULT_PLEDGE_AMOUNT} per week to cover their most basic living needs.

    Please contact me to provide further information.
    MAIL
    body
  end

  def email_link(recipient)
    [
      "mailto:help@helpsomebody.co.za?",
      "subject=#{email_subject(recipient)}",
      "&body=#{email_body(recipient)}"
    ].join
  end
end
