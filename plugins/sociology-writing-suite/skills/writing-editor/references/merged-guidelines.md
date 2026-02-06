# Writing Editor: Merged Guidelines

A unified editing reference. Organized top-down: Document → Paragraph → Sentence → Word.

Work through each level with a human checkpoint before moving to the next.

---

## Step 0: Document Protection

**Before making any edits**, establish how changes will be tracked.

### Option A: Working Copy (Default)

Create a copy of the original file and edit only the copy.

- Input: `draft.md` → Working file: `draft-working.md`
- Original file is never modified
- Safe for users without version control experience

### Option B: Git Tracking

Use git to create a full revision history with commits after each phase.

**Setup**:
1. Check if file is in a git repo
2. If not, offer to `git init` in the file's directory
3. Commit the original state before any edits: `"Writing editor: Original state"`

**After each level**:
- Commit approved changes with descriptive message
- Example: `"Writing editor: Level 1 (Document) complete"`

**Benefits**:
- Full diff history between phases
- Easy to revert any level's changes
- User can see exactly what changed at each stage

**Never edit the original file directly unless git tracking is active.**

---

## The Core Method: Deletion Test

Remove each word or phrase. If meaning doesn't change, delete it.

**Before**: "It is important to make its steps explicit so that we can see how it works."
**After**: "If we make the steps explicit, we can see how it works."

Apply at every level.

---

# Level 1: Document

Start here. Fix structure, openings, and overall architecture before touching sentences.

## 1.1 Open with a Hook

75% of articles open with bland formulas. Join the 25% that hook readers.

**Hook types**:
- Opening question
- Quotation (literary or scholarly)
- Personal anecdote
- Historical scene-setting
- Surprising fact
- Direct address: "Consider..." "Imagine..."

**Before**: "Academic writing is increasingly acknowledged as an important area of inquiry..."
**After**: "It happened on 19th April 1964. It was bluebell time in Kent."

## 1.2 Write Short, Unified Titles

Long titles with variable lists and colons don't increase citations.

**Avoid**: "A, B, and C in the Context of D: An Ethnographic Study Using Method X"

**Techniques**:
- Questions: "Why Do Children Die?"
- Concrete images: "The Man Who Mistook His Wife for a Hat"
- Surprising juxtaposition: "The Foreign Policy of the Calorie"

## 1.3 Match Structure to Promise

If your opening announces four topics, your section headings must follow that order.

**Structural options**:
- IMRAD (Introduction, Method, Results, Discussion)
- Hybrid: Generic headings with unique subsections
- Thematic: Metaphor-driven architecture throughout

Violating your announced structure signals shoddy thinking.

## 1.4 Write Active Abstracts

**Before**: "The authors investigated... Implications are discussed..."
**After**: "We show that X causes Y. This challenges the assumption that..."

Include humans. Make claims. Minimize hedging.

## 1.5 Cite with Purpose

**Audit each citation**: Does this author's idea do work here, or am I just name-dropping?

- Remove citations that only signal allegiance
- Break 16+ citation sentences into multiple sentences
- Always include page numbers
- Read citations aloud—if they disrupt rhythm, fix them

## 1.6 Ground Abstract Claims in Concrete Examples

For each abstract concept, provide at least one concrete illustration.

**Before**: "The change in privacy concepts..."
**After**: "Rooms in older houses had doors; modern apartments have open plans."

**Rule**: At least one concrete image per major section.

---

# Level 2: Paragraph

After document structure is sound, examine paragraph-level patterns.

## 2.1 End Paragraphs Without a Moral

Don't "land the plane" with summary statements.

**Pattern to fix**: "Together, these changes underscore the manuscript's contribution to..."

**Fix**: End after the analysis. Silence reads as confidence.

## 2.2 Break Symmetry Across Paragraphs

If three paragraphs start the same way, rewrite one.

**Pattern to fix**: Each paragraph follows "First X, Second Y, Third Z."

**Fix**: Let one paragraph be shorter, more direct, or structured differently.

## 2.3 Break the Triplet Habit

Lists of three feel rhetorical. Two feels human.

**Before**: "The revision improves clarity, coherence, and empirical grounding."
**After**: "The revision improves clarity and grounding."

## 2.4 Avoid Over-Balanced Contrast

"Not X, but Y" constructions are often redundant.

**Before**: "The paper is not merely descriptive, but analytically ambitious."
**After**: "The paper moves beyond description."

**Rule**: If a sentence has both *not* and *but*, try one clause.

## 2.5 Match Syntax to Logic

Coordinate clauses suggest equal importance. Show hierarchy through grammar.

**Before** (three equal clauses): "The theory is simple, it is important to make steps explicit, so we can see how it works."

**After** (if-then): "If we make the steps of this simple theory explicit, we can see how it works."

**Rule**: Put subordinate ideas in subordinate grammatical positions.

---

# Level 3: Sentence

After paragraphs are structured well, fix sentence-level issues.

## 3.1 Name the Agent (Fix Passive Voice)

Passive voice hides who acted. Show who did what.

| Passive | Active |
|---------|--------|
| "Deviants were labeled" | "Teachers labeled them" |
| "Data were collected" | "We collected data" |
| "It has been shown that" | "Smith shows that" |
| "Policies have been implemented" | "The district implemented policies" |
| "A correlation was obtained" | "We found a correlation" |

**Rule**: For each passive, ask: Who did this? Make that actor the subject.

## 3.2 Use First Person

The myth that academics avoid "I/we" is false. Data shows:
- Medicine: 92% use personal pronouns
- Evolutionary biology: 100%
- Philosophy: 92%

| Impersonal | Personal |
|------------|----------|
| "This study examines..." | "We examine..." |
| "The authors argue..." | "I argue..." |
| "It can be concluded..." | "We conclude..." |

## 3.3 Replace Abstract Nouns with Verbs

Nominalizations (-tion, -ity, -ness, -ment) drain energy.

| Abstract | Concrete |
|----------|----------|
| "The investigation of..." | "We investigated..." |
| "The development of efficacy" | "How teams develop confidence" |
| "The clarification of dynamics" | "Clarifying who does what" |

**Test**: For every -tion noun, ask if a verb form is stronger.

## 3.4 Replace Abstract Placeholders with Specifics

Vague relation-words mark unfinished thinking.

| Placeholder | Ask yourself |
|-------------|--------------|
| "complex relation between" | What is the relation? |
| "a set of factors" | Which factors? Name them. |
| "a kind of" | What kind? Be specific. |

**Before**: "There is a complex relation between class and achievement."
**After**: "Working-class children score lower because..."

## 3.5 Pair "This" with a Noun

Deictic pronouns create ambiguity.

| Ambiguous | Clear |
|-----------|-------|
| "This shows that..." | "This finding shows..." |
| "This is important because..." | "This pattern is important because..." |

## 3.6 Eliminate "There is/are" Openings

Existential openings delay the real subject.

| Weak | Strong |
|------|--------|
| "There is limited research on X" | "Fewer than 10 studies examine X" |
| "There are many factors that..." | "Many factors..." |
| "There remain unanswered questions" | "We don't know whether X affects Y" |

## 3.7 Keep Subject and Verb Close

Readers lose track when separated by too many words.

**Before** (23 words between subject and verb):
"The knowledge that criminalization of marijuana use can lead to a wide variety of other social ills has not prevented lawmakers..."

**After**: "Lawmakers know marijuana criminalization carries risks, but they haven't changed policy."

**Rule**: Keep subject and verb within 12 words.

## 3.8 Use Vivid Verbs

Replace weak verbs with ones that show action.

| Weak | Vivid |
|------|-------|
| "is available" | "applies" |
| "was done" | "examined" / "tested" |
| "shows" | "reveals" / "demonstrates" |

**Stylish verbs**: lurk, puzzle, fascinate, rebuff, overturn, tax, exhilarate

## 3.9 Kill Dead Metaphors

Clichés take up space without showing anything new.

**Cut**: "cutting edge," "covers terrain," "rich issue," "growing body of literature," "bottom line," "plant the seeds of," "shed light on," "pave the way"

**Keep metaphors that** are fresh, developed point-by-point, or force readers to see something new.

## 3.10 Cut Meta-Commentary

Sentences that comment on process, intent, or strategy rather than content.

**Before**: "This decision reflects a clear understanding of the reviewers' concerns."
**After**: "This decision addresses the reviewers' concerns."

**Rule**: If a sentence narrates what you're doing, cut or compress.

## 3.11 Replace Grand Evaluations with Observable Effects

Trade abstract virtues for what changes for the reader.

**Before**: "This significantly enhances the manuscript's conceptual clarity and empirical rigor."
**After**: "This makes the argument easier to follow and better supported."

## 3.12 Allow Judgment Without Over-Justification

Humans sometimes assert without footnoting their reasoning.

**Before**: "This was the correct strategic decision, as it allowed the manuscript to avoid..."
**After**: "This was the right decision."

## 3.13 Prefer "Because" Over "This Reflects"

Replace abstract reflection language with causal explanation.

**Before**: "This reflects a broader shift in the manuscript's theoretical orientation."
**After**: "Because the spatial framework is gone, the analysis now follows the interviews more closely."

## 3.14 Replace Em/En Dashes with Commas or Restructure

Em dashes (—) and en dashes (–) create artificial drama and interrupt reading flow. Replace with commas or restructure the sentence.

| With dashes | Without dashes |
|-------------|----------------|
| "The respondents—who had previously expressed happiness—decided to leave" | "The respondents, who had previously expressed happiness, decided to leave" |
| "Three factors—cost, time, and risk—drove the decision" | "Three factors drove the decision: cost, time, and risk" |
| "She found—surprisingly—that wages had fallen" | "She found, surprisingly, that wages had fallen" |
| "The policy—implemented in 2019—failed immediately" | "The policy, implemented in 2019, failed immediately" |

**When dashes might stay**:
- Abrupt interruption that's the point: "He started to explain—but then stopped."
- Range notation: "pages 12–15" (en dash is standard here)

**Rule**: For parenthetical insertions, commas almost always work better. Dashes signal "pay attention to this aside!" when the aside rarely deserves that emphasis.

---

# Level 4: Word

After sentences are clear, polish word choice.

## 4.1 Cut Throat-Clearing Phrases

Announcements of what you're about to do instead of doing it.

| Cut | Keep |
|-----|------|
| "It is important to..." | [just do it] |
| "It merits attention that..." | [state the claim] |
| "It should be noted that..." | [note it] |
| "This chapter will examine..." | [examine it] |
| "An attempt to shed light on..." | "I investigate..." |

**Test**: If it's important, doing it makes that clear.

## 4.2 Cut Signpost Words

Words that label importance instead of demonstrating it.

**Delete**: "Importantly," "Overall," "More importantly," "Significantly," "Notably," "Interestingly,"

**Before**: "Importantly, the author now engages with..."
**After**: "The author now engages with..."

## 4.3 Cut Evaluative Adverbs

Adverbs that try to do the work of evidence.

| Cut | Keep |
|-----|------|
| "convincingly demonstrates" | "demonstrates" |
| "clearly shows" | "shows" |
| "effectively addresses" | "addresses" |

**Test**: Delete the adverb. Does meaning change? If no, cut it.

## 4.4 Cut Empty Intensifiers

Words that add length without adding meaning.

| Wordy | Direct |
|-------|--------|
| "reasonably comprehensive" | "comprehensive" |
| "relatively limited" | "limited" |
| "somewhat problematic" | "problematic" |

## 4.5 Replace Ability Phrases

These hint at difficulty that may not exist.

| Wordy | Direct |
|-------|--------|
| "managed to maintain" | "kept" |
| "were able to" | "could" |
| "had the capability of" | "can" |

## 4.6 Replace Fancy-Talk

Ceremonial language that means the same as plain language.

| Fancy | Plain |
|-------|-------|
| "unified stance" | "agreement" |
| "confronted the issue" | "talked about" |
| "predicated upon" | "depends on" |
| "the way in which" | "how" |
| "with regard to" | "about" |

**Test**: Does the fancy version mean anything different? If no, use plain.

## 4.7 Reduce Excessive Praise

Academic reviewers understate. Enthusiasm reads as synthetic.

**Before**: "This is a thoughtful, rigorous, and sophisticated analysis."
**After**: "This is a careful analysis." / "The analysis is solid."

---

# Quick Reference: Common Transformations

| Avoid | Use Instead |
|-------|-------------|
| "It is important to note that X" | X |
| "It has been shown that X" | "Smith shows X" |
| "There is evidence that X" | "Evidence shows X" |
| "Data were collected" | "We collected data" |
| "This study is concerned with X" | "This study examines X" |
| "An attempt to shed light on X" | "I investigate X" |
| "The investigation of X" | "We investigated X" |
| "Little is known about X" | "We know little about X" |
| "A correlation was obtained" | "We found a correlation" |
| "It can be concluded that X" | "We conclude X" |

---

# Calibration

**Goal**: Prose that sounds specific, slightly uneven, and willing to assert judgments without narrating its own cleverness.

**Not the goal**: Perfect prose. Functional prose is human. Allow mild awkwardness.

**Final test**: Read aloud. Warning signs:
- "This sounds like a report"
- "This feels over-controlled"
- "This could be a template"
- "This sounds translated from German"

---

# Editing Workflow

0. **Document protection**: Create working copy OR set up git tracking → User chooses
1. **Document level**: Fix structure, hooks, titles, abstracts → Human checkpoint (git commit if tracking)
2. **Paragraph level**: Fix symmetry, triplets, endings → Human checkpoint (git commit if tracking)
3. **Sentence level**: Fix passive voice, agents, abstract nouns, em/en dashes → Human checkpoint (git commit if tracking)
4. **Word level**: Fix adverbs, signposts, fancy-talk → Human checkpoint (git commit if tracking)
5. **Read aloud**: Final calibration check
