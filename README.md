# Returnly RDBMS Schema Design Challenge

## Goal

The goal of this exercise is to show and engage with the Returnly engineers.  We want to see how you approach and solve a technical problem.

## Process

This exercise is not meant to be extremely challenging.  If you have any questions do not hesitate to email us for clarity.  Most importantly, please read all instructions before beginning.

Please write all code on a branch.  You can name the branch anything you want.  When you are ready for Returnly to review the assignment please open a Pull Request on GitHub.

Once the Pull Request has been opened Returnly engineers will then ask questions about your code.  These questions are meant to start discussions and learn your thought process.

This project is designed to take about 4 hours to complete.  We know you have other obligations so we give you a 48 hour window of your choosing.  If you need more time please let us know.

## Project Specifics

### Context

You are a DB Engineer working as a part of a team of 10 developers building the DB foundation for the E-Commerce company's main software offering. The software, like the real Returnly's case, is *used* primarily by individual consumers, but *sold* to businesses as a subscription.

You "know" the product will be popular and thus you need to design for high concurrency and large volume. Please think of any additional considerations that may be important in a real scenario.

Another engineer (who probably doesn't have DB design as his/her main strengths) took a stab at the task. Your job is to review the code in the form of a Pull Request and correct logical/semantic, syntax, and stylistic (there's a [loose style guide](#style-guide)) errors. You are expected to provide specific code alternatives as the suggestions and leave valuable feedback for the original author to learn from.

As the PR for this task evolves and changes are made, consider how can some smoke testing be introduced, and how to, potentially, make that part of a hypothetical CI process.

It is expected that you will have questions as you take on this assignment. Please try make as many **reasonable** assumptions on your own as possible, but do ask questions that you feel must be answered by a hypothetical product owner or a tech lead / architect.

### Requirements

The company needs to keep track of the following entities:

##### Merchants
`Merchants` represent **business** customers.

We want to store the basics like name, contact info, address/location, and any additional pertinent data that may become useful in profiling merchants however we don't want to over engineer that last point.

Another group of engineers is building an internal tool to locate all merchants with a given address or a portion of an address (e.g. city).

##### Billing Plans

A `billing plan` represents a level of service offered to a `merchant`. The plans must have an internal code, name or description, and subscription terms (e.g. monthly).
Examples of plan codes are `BRONZE`, `SILVER`, `GOLD`. There are also some plans that can be purchased in addition to either of the above ones, for example `EXTRAS`.

Merchants can upgrade/downgrade throughout their relationship with us.
Company's accountant states it's important to keep track of those changes.

##### Shoppers

`Shoppers` are the main users of the software.

We want to keep track of the basics like `name` and `email`, as well as billing address. There may be tens of millions of shoppers. It is necessary to keep track of which merchants a give shopper has a relationship with.

Another group of engineers is building an internal tool to locate all shoppers with a given address or a portion of an address (e.g. city) for a given merchant.

### Technical Constraints

#### Style Guide

1. All surrogate keys should be named `sk_id`
2. All table names are in plural form
3. All natural keys should be identified as _unique constraints_
4. All foreign key names should reference parent and child table names (possibly abbreviated)
5. All monetary amounts are stored as whole cents
6. Use of `enum` types is encouraged for small and very stable sets and discouraged otherwise

#### DB engine

The team currently uses MySQL `5.7` but contemplates transitioning to another engine so use as few custom constructs as possible and prefer standard ANSI SQL.

#### Design methodology