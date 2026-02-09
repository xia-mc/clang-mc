pub struct SourceLineBuilder {
    code: String,
    skip: bool,
    last_white_space: bool
}

impl SourceLineBuilder {
    pub fn new() -> Self {
        Self {
            code: String::new(),
            skip: false,
            last_white_space: false,
        }
    }

    pub fn push_str(&mut self, string: &str) {
        for char in string.chars() {
            self.push(char);
        }
    }

    pub fn push(&mut self, ch: char) {
        if let '"' | '\'' = ch {
            self.skip = !self.skip;
        }

        if ch.is_whitespace() && ch != '\n' && !self.skip {
            if !self.last_white_space {
                self.code.push(' ');
                self.last_white_space = true;
            }
        } else {
            self.code.push(ch);
            self.last_white_space = false;
        }
    }

    pub fn build(self) -> String {
        self.code
    }
}
