package dto;

import java.util.List;

import com.aaron.babebasket.models.Category;

public class CategoryDTO extends Category {

	private int count;

	public CategoryDTO(String id, String categoryName, List<String> subcategories, int count) {
		setId(id);
		setCategoryName(categoryName);
		setSubcategories(subcategories);
		this.count = count;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CategoryDTO [count=" + count + "]";
	}

}
