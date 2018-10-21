#ifndef __LINKEDLIST__
#define __LINKEDLIST__

template <class T>
class LinkedListElement {
private:
    T* element;
    LinkedListElement* next;
    LinkedListElement* previous;
public:
    LinkedListElement(T& e, LinkedListElement& p, LinkedListElement& n);
    LinkedListElement(T* e, LinkedListElement* p, LinkedListElement* n);
    LinkedListElement(const LinkedListElement& l);

    void setNext(LinkedListElement& l);
    void setNext(LinkedListElement* l);
    const LinkedListElement& getNext() const;
    LinkedListElement& getNext();

    void setPrevious(LinkedListElement& l);
    void setPrevious(LinkedListElement* l);
    const LinkedListElement& getPrevious() const;
    LinkedListElement& getPrevious();

    void setElement(T& e);
    void setElement(T* e);
    T& getElement();
    const T& getElement() const;

    LinkedListElement& operator=(const LinkedListElement& l) const;
};

template <class T>
class LinkedList {
public:
    LinkedListElement* head;
    LinkedListElement* tail;
};

#endif
