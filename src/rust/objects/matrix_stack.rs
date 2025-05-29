use std::vec::Vec;

pub struct MatrixStack<T> {
    stack: Vec<T>,
}

#[allow(dead_code)]
impl<T> MatrixStack<T> {
    pub fn new() -> Self {
        Self {
            stack: Vec::new(),
        }
    }

    #[inline(always)]
    pub fn push_matrix(&mut self, object: T) {
        self.stack.push(object);
    }

    #[inline(always)]
    pub fn pop_matrix(&mut self) -> T {
        self.stack.pop().unwrap()
    }

    #[inline(always)]
    pub fn is_empty(&self) -> bool {
        self.stack.is_empty()
    }

    #[inline(always)]
    pub fn size(&self) -> usize {
        self.stack.len()
    }
}
